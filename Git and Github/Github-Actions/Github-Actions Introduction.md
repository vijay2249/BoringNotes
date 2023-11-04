
---

Contents covered:
1. jobs -- what are jobs in github workflow
2. runs-on -- what is this keyword mean
3. steps -- what are steps in github actions
4. Environment Variables -- what are env values, and how to use and reuse them
	1. Defining environment variables for a single workflow
	2. Defining configuration variables for multiple workflows
	3. Writing values into GITHUB_ENV
5. JOBS_OUTPUT -- using one job output by another job


---

You can create a workflow file configured to run on specific events 

Official Docs ->  [Configuring a workflow](https://help.github.com/en/articles/configuring-a-workflow) and [Workflow syntax for GitHub Actions](https://help.github.com/en/articles/workflow-syntax-for-github-actions) and  [GitHub Actions](https://help.github.com/en/articles/about-github-actions#core-concepts-for-github-actions)


Assuming you know the basics of actions like what are they I am continuing the explanation

---

Now the basic thing is that the actions must include **jobs** keyword and its actions 
### jobs

A `job` is defined task made up of `steps`. Each job is run in a fresh instance of virtual environment.

You can define the dependency rules for how jobs run in a workflow file. Jobs can run at the same time in parallel to be dependent on the status of a previous job and run sequentially

Example case:
	Workflow can have two sequential jobs that build and test code, where the test job is dependent on the status of the build job. If the build job fails, then test job will not run

---
### runs-on
Github hosts virtual machine to run these jobs as mentioned above, we can mention which OS to run these jobs on

```yaml
jobs:
	First-job:
		runs-on: ['windows', 'ubuntu']
	second-job:
		runs-on: 'ubuntu'
```
All the mentioned jobs execute in the same instance of the virtual environment by default but you can change it, allowing the actions in that job to share information using the file system

---
### steps

A step is a set of tasks performed by a job.
Each step in a job executes in the save environment, allowing the actions in that job to share information using the filesystem if necessary.

These steps can run system commands or actions that user require

```yaml
jobs:
	start-action:
		name: "Add Steps in workflow"
		steps:
		
			- name: "Hello MOM"
			  run: echo "Hello MOM"
```

---
## Environment Variables

Now some command or actions might require some env variables that we cannot hardcode these values in our code, they might be some username passwords or api keys etc.

You can set a custom variables in two ways
1. To define an environment variable for use in a single workflow, you can use the `env` key in the workflow file.
2. To define a configuration variable across multiple workflows, you can define it at the organization, repository, or environment level.

Now how can we mention them in our actions file

```yaml
jobs:
	env-example:
		name: "Env vals example"
  		runs-on: 'ubuntu'
  		steps:
	  		- name: "Hello MOM"
	  		  run: "hello $WHO"
	  		  env:
	  		   - WHO: MOM
	  		
```

Now github by default gives access to some environment variables which depends on github user and varies from user to user

```yaml
jobs:
	github-env:
		name:"Github ENV example"
		runs-on: 'ubuntu'
		steps:
			- name: Hello MOM
			  run: "Hello $GITHUB_ACTOR"
```

The complete list of github env variables that github provides by default are here [default-environment-variables](https://docs.github.com/en/actions/learn-github-actions/variables#default-environment-variables) 

### Defining environment variables for a single workflow

To set a custom env variable for a single workflow, you can define it using the `env` key in the workflow file

The scope of custom variable is set by this method is limited to the element in which it is defined.

You can define variables that are scoped
- the entire workflow, by using `env` at the top level of the workflow
- the contents of a job within a workflow, by defining the key value pair inside a job
- a specific step within a job, by defining that key value pair inside that particular step

```yaml
name: This is env variable example defining in workflow
on:
	workflow_dispatch
env:
	BOSS: "MOM" %% this env is avaiable for all the jobs/steps in the workflow %%

jobs:
	greeting_job:
		runs-on: ubuntu
		env:
			Greeting: "Good" %% this env is available to all steps within this job %%
		steps:
			- name: "wishes to MOM"
			  run: echo "$Greeting $BOSS, have a great $DAY"
			  env:
				  DAY: "Friday" %% this env value is available to only this step %%
```


The commands in the `run` steps of a workflow, or referenced actions, are processed by the shell you are using on the runner. The instructions in the other parts of a workflow are processed by Github Actions and are not sent to the runner.

Because runner environment variable interpolation is done after a workflow job is sent to a runner machine, you must use the appropriate syntax for the shell that's used on the runner.

Example:
	when you use `ubuntu` these use bash shell, so you must use the syntax `$KEY` , and for windows env use PowerShell, so you would use the syntax `$env:KEY` 


> - Now you cant just name these env variables as you want, there are some default env variables that github gives you to use them and you cant name your env keys to be these names
> - Example in the above code snipper where we used, GITHUB_ACTOR as env value into run command directly you can create env value with key as GITHUB_ACTOR
> - If you try to override the value of one of these default variables, the assignment is ignored by github runners




---
### Defining configuration variables for multiple workflows

You can create configuration variables for use across multiple workflows, and can define them at either the organization, repository or environment level

Example, you can use configuration variables to set default values for parameters passed to build tools at an organization level, but then allow repository owners to override these parameters on case-by-case basis

When you define configuration variables, they are automatically available in the `vars` context, 

> If a configuration variable has not been set, the return value of a context referencing the variable will be empty string

```yaml
name: var usage example workflow

on:
  workflow_dispatch:
env:
  # Setting an environment variable with the value of a configuration variable
  env_var: ${{ vars.ENV_CONTEXT_VAR }}

jobs:
  display-variables:
    name: ${{ vars.JOB_NAME }}
    # You can use configuration variables with the `vars` context for dynamic jobs
    if: ${{ vars.USE_VARIABLES == 'true' }}
    runs-on: ${{ vars.RUNNER }}
    environment: ${{ vars.ENVIRONMENT_STAGE }}
    steps:
    - name: Use variables
      run: |
        echo "repository variable : $REPOSITORY_VAR"
        echo "organization variable : $ORGANIZATION_VAR"
        echo "overridden variable : $OVERRIDE_VAR"
        echo "variable from shell environment : $env_var"
      env:
        REPOSITORY_VAR: ${{ vars.REPOSITORY_VAR }}
        ORGANIZATION_VAR: ${{ vars.ORGANIZATION_VAR }}
        OVERRIDE_VAR: ${{ vars.OVERRIDE_VAR }}
        
    - name: ${{ vars.HELLO_WORLD_STEP }}
      if: ${{ vars.HELLO_WORLD_ENABLED == 'true' }}
      uses: actions/hello-world-javascript-action@main
      with:
        who-to-greet: ${{ vars.GREET_NAME }}

```

The if conditionals are processed by Github Actions and only the steps where the check resolves as true are sent to the runner. 

---

### Writing values into GITHUB_ENV

If you generate a value in one step of a job, you can use the value in subsequent steps of the same job by assigning the value to an existing or new environment variable and then writing this to the `GITHUB_ENV` environment file.

```bash
echo "{environment_variable_name}={value}" >> "$GITHUB_ENV"

```

```yaml
steps:
  - name: Set the value
    id: step_one
    run: |
      echo "action_state=yellow" >> "$GITHUB_ENV"
  - name: Use the value
    id: step_two
    run: |
      printf '%s\n' "$action_state" # This will output 'yellow'

```

The environment file can be used directly by an action, or from a shell command in the workflow file by using the `run` keyword.

## JOBS_OUTPUT

If you want to pass a value from a step in one job in a workflow to a step in another job in the workflow, you can define the value as a job output
Then you can then reference this job output from a step in another job

```yaml
jobs:
  job1:
    runs-on: ubuntu-latest
    # Map a step output to a job output
    outputs:
      output1: ${{ steps.step1.outputs.test }}
      output2: ${{ steps.step2.outputs.test }}
    steps:
      - id: step1
        run: echo "test=hello" >> "$GITHUB_OUTPUT"
      - id: step2
        run: echo "test=world" >> "$GITHUB_OUTPUT"
  job2:
    runs-on: ubuntu-latest
    needs: job1
    steps:
      - env:
          OUTPUT1: ${{needs.job1.outputs.output1}}
          OUTPUT2: ${{needs.job1.outputs.output2}}
        run: echo "$OUTPUT1 $OUTPUT2"
```

These outputs are "UNICODE" string, and can be a maximum of 1MB. The total of all outputs in a workflow can be a max of 50MB

Jobs outputs containing expressions are evaluated on the runner at the end of each job. Outputs containing secrets are redacted on the runner and not sent to the github actions
