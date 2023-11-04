
[[Continuous Integration (CI) - GitHub Actions]] 

Continuous Integration(CI) is often coupled with the idea of Continuous Delivery(CD).

For releasing or publishing our code automatically, we will use the action [Release Drafter](https://github.com/marketplace/actions/release-drafter)

Now we have to configure our actions file.

We can create new workflow file or we can add this workflow to our already present files.

#### If you want to add the release drafter workflow to already present action file, then the snippet is 

```yaml
name: <PreviousContent>

on:
	<PreviousContent>

jobs:
	allPreviousJos:
		<PreviousJobsContent>

	update_draft_release:
		runs-on: ubuntu-latest
		needs: [ All previous jobs comma separated ]
		steps:
			- uses: toolmantim/release-drafter@v5.2.0
			  env:
				  GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

If you see the above code snippet we added one more keyword `needs`

---
#### needs

This just means that this particular jobs requires the mentioned jobs to be executed first then run this particular job.

In our code, we need our publish job to be executed once all our tests and build process is executed successfully, so in that sense we want to execute the build, test, and all other steps to run perfectly and then execute this publish method.

```yaml
jobs:
	hi-mom:
		runs-on: ubuntu-latest
		steps:
			run: echo Hi MOM
	hi-dad:
		runs-on: ubuntu-latest
		steps:
			run echo Hi DAD

	hi-bro:
		runs-on: ubuntu-latest
		needs:
			- job1
			- job2
		steps:
			run: echo "Hello BRO"
```

---

#### If you are adding new workflow file for the auto-publish process

create new file with whatever name you want and have the below content in that file

```yaml
name: Release Drafter

on:
  push:
    # branches to consider in the event; optional, defaults to all
    branches:
      - master
  # pull_request event is required only for autolabeler
  pull_request:
    # Only following types are handled by the action, but one can default to all as well
    types: [opened, reopened, synchronize]
  # pull_request_target event is required for autolabeler to support PRs from forks
  # pull_request_target:
  #   types: [opened, reopened, synchronize]

permissions:
  contents: read

jobs:
  update_release_draft:
    # permissions:
      # write permission is required to create a github release
      # contents: write
      # write permission is required for autolabeler
      # otherwise, read permission is required at least
      # pull-requests: write
    runs-on: ubuntu-latest
    steps:
      # (Optional) GitHub Enterprise requires GHE_HOST variable set
      #- name: Set GHE_HOST
      #  run: |
      #    echo "GHE_HOST=${GITHUB_SERVER_URL##https:\/\/}" >> $GITHUB_ENV

      # Drafts your next Release notes as Pull Requests are merged into "master"
      - uses: release-drafter/release-drafter@v5
        # (Optional) specify config name to use, relative to .github/. Default: release-drafter.yml
        # with:
        #   config-name: my-config.yml
        #   disable-autolabeler: true
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

Once this is done, 
The release drafter requires a template to create all the changes and updates that the release had and little like documentation for updated version of release thing.

So create this template in `.github` folder with below contents
```yaml
template: |

  ## What's Changed

  $CHANGES
```

now commit the changes.

Remember that the template should be named as `release-drafter.yml` in `.github` folder in your repo

---

Here comes the good part

Make some random changes in the repo but not in main branch, let those changes be anything

Here i will do some changes regarding in the index.js file and commit them in the `testing` branch

Once the necessary changes are done, raise the pr and wait for workflows to run and see whether they all checks are passed or not, if not __resolve the issue__

---

#### Releases

Now if you click on `releases` link in your repo, you will see a draft release docs already being created which is created by _github-actions_

The draft version may look something like this

![[Git and Github/Github-Actions/Images/Draft-Release-Content.png]]
You can also edit this draft or delete this draft 

Now release your package...

