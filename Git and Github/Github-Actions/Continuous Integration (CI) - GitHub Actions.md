

Base Repository for this example is [Github-Actions-Playground](https://github.com/vijay2249/github-actions-playground)

---

#### Topics Covered

1. NodeJs Workflow changes from generated default workflow 
2. strategy -- what is strategy in github actions
3. matrix -- what is the use of this in github actions
4. include -- what is the use of this in github actions
5. workflow_dispatch -- what is this in github actions
6. Actual workflow of our nodejs action
7. Building the test node js app.
8. Then seeing whether the actions are running correctly or not


---


The playground repository contains the javascript code and we are going to use NodeJs environment to test and build our code.

For this you can fork this repo or create new one in another language maybe Scala or Python to actually get your hands dirty in all ways.

Go to repository -> Actions Tab -> Search for lang CI action (in my case it is NodeJs env) -> click on Configure button

---

#### If you are not using NodeJs workflow you can skip this section

The changes I made from the default yaml file
1. I don't need Node 14.x version
2. Added `name` fields in all `npm` commands

---

#### strategy

This is used to `matrix` strategy for jobs, (which we discussed in github-actions series in dev.to post) [Intro to GITHUB ACTIONS](https://dev.to/vijay2249/intro-to-github-actions-2ce)

A matrix strategy lets you use variables in a single job definition to automatically create multiple jobs that are based on the combinations of the variables.

Example case is that you want to test your code in multiple versions and in multiple os systems

For this we use `matrix` 

---

#### matrix

Use this to define your variables of different job configurations.
Within your matrix, you can define one or more variables followed by an array of values.

Examples:
```yaml
name: github matrix example

jobs:
	matrix_example:
		strategy:
			matrix:
				members: ["MOM", "DAD", "BRO"]
		steps:
			- name: Say hello to everyone
			  run: echo Hello ${{matrix.members}}
```

You can also use multiple variables in the matrix 

```yaml
name: github matrix example

jobs:
	matrix_example:
		strategy:
			matrix:
				members: ["MOM", "DAD", "BRO"]
				os: [windows-latest, ubuntu-latest]
		runs-on: ${{matrix.os}}
		steps:
			- name: Say hello to everyone
			  run: echo Hello ${{matrix.members}}
```

This above workflow will run for each possible combination of the variables "os" and "members"


To add new values to the matrix variable you can use `include` key to do that.

---

#### include

For each object in the `include` list, the key:value pairs in the object will be added to each of the matrix combinations if none of the key:value pairs overwrite any of original matrix values

If the object cannot be added to any of the matrix combinations, a new matrix combination will be created instead.
The original matrix values will not be overwritten, but added matrix values van be overwritten

```yaml
strategy:
  matrix:
    fruit: [apple, pear]
    animal: [cat, dog]
    include:
      - color: green
      - color: pink
        animal: cat
      - fruit: apple
        shape: circle
      - fruit: banana
      - fruit: banana
        animal: cat
```

Now the runner have the following combinations to run the job
1. {fruit: apple, animal: cat, color: pink, shape: circle}
2. {fruit: apple, animal: dog, shape: circle, color: green}
3. {fruit: pear, animal: cat, color: pink}
4. {fruit: pear, animal: dog, color: green}
5. {fruit: banana, animal: cat}
6. {fruit: banana}

---

#### workflow_dispatch

To run a workflow manually, the workflow must be configured to run on the `workflow_dispatch` event

> To trigger the `workflow` event, your workflow must be in the default branch.
> Based on your configurations, write access might be required to the repository is required to perform jobs


---

#### Actual workflow of our nodejs action

Now coming to the CI part of actions.

create and commit that yml/yaml file to github repo

Once you commit your file, if you go to actions tab, you will one action that is automatically started, well there will be multiple if you follow previous article also, but for time being one NodeJs action will be triggered automatically.

Why you might ask..

Well the reason is the below code snippet in the yaml file
```yaml
on:
	push:
		branches: ['main']
	pull_request:
		branches: ['main']

	workflow_dispatch:
```

Now you already know why `workflow_dispatch` is added.

Moving on we also added `push` and `pull_request` that means that for every pull request and commits in that particular branch of __main__ the action will start automatically.

---

So far we have not clearly seen this actions to clear usage I think.
Like we want to use these actions while we are collaborating right.

So let us create a new branch from the repo and we will make some changes and create a pull request to the default main branch.

Now my main branch name is `main` and i will be creating a branch `testing` from the `main` branch and I will add a new test case in this `testing` branch in `index.test.js` file

```javascript
test('that weekNum returns a number', () => {
  expect(weekNum).toBeDefined();
});
```

Add the above code snippet in `index.test.js` file.

Now create a pull request(pr) from your testing branch to your main branch.

Once the pr is raised you will see the checks from nodejs action file starts running.
You will see something like this
![[NodeJs-Actions.png]]

Now you can see the power of github actions

You don't have to worry about first merging the changes and go through hell to find out that there are some conflicts in production and then try to find out what are the changes that need to be done again.

Instead you will implement all those checks for all the PRs and if these checks are successful you can merge these changes and don't have to worry about fixing the errors in production because you are checking them before releasing them or better even before merging new changes to base code.

---

So the install and test process of our workflow is done and there are no errors.

Lets go through build process

---
## Build process

The Github Actions workflow allows users to take advantage of vast selection of open source tools and solutions. Since actions workflow _runners_ are in themselves VMs running on cloud servers.

This is different from GitHub app workflow, which requires you to host it on your own server

For this we will use [Parcel](https://parceljs.org/getting-started/webapp/) to build our scripts.

First install the module
```bash
npm i -D parcel
```

Since we have only one file we can build using the command
```bash
npx parcel index.js
```

Else in out `package.json` file add the following configuration in _scripts_ variable

```
"build": "parcel build index.js
```

Once after adding, this should be the outlook of your `package.json` file 

```json
{
  "name": "github-actions-playground",
  "version": "0.1.0",
  "description": "playground area to learn about github-actions",
  "main": "index.js",
  "scripts": {
    "test": "jest",
    "build": "parcel build index.js" //here we are directly pointing to the file we need to build
  },
  "author": "vijay2249",
  "license": "ISC",
  "devDependencies": {
    "jest": "^29.7.0",
    "parcel": "^2.10.1"
  }
}
```

Now once the changes are done, commit your changes and then the actions will run automatically as you mentioned in yml file that the action should run on each pull request and on each push to global repo.

So now scroll down to the build step and now see for yourself how the output looks like in the build step.

Consider this as homework or getting your hands dirty.

Side Note -> see the logs on how to change things if there is any error.



BTW [starter-workflows](https://github.com/actions/starter-workflows)  <- this is official github repository with some examples on github actions.
Just go through them and you have to spend less time reading these type of extra peoples notes :)

:) :) 

Lets continue the next part some other time.