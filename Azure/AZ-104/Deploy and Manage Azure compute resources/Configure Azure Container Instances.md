
- Identify when to use containers versus virtual machines
- Identify the features and usage cases of azure container instances
- implement azure container groups


---

Containers and virtual machines are both forms of virtualization, but there are some key differences between the

Hardware virtualization has made it possible to run multiple isolated instances of operating systems concurrently on the same physical hardware. Containers represent the next stage in the virtualization of computing resources.

Things to consider when using containers
- consider flexibility and speed
- consider testings
- consider app deployment environment
- consider workload density

---

Container group is similar to a pod in kubernetes. A pod typically has a 1:1 mapping with a container, but a pod can contain multiple containers. The containers in a multi-container pod can share related resources

Azure container instances allocated resources to a multi-container group by adding together the resource requests of all containers in the group. Resources can include items such as CPUs , memory and GPUs