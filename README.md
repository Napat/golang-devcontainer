# Golang with Devcontainer

## How to

*Run in DevContainer:* Open your project directory in VS Code. If you have the **"Dev Containers"** extension installed, you'll see a green icon in the lower-left corner. Click on it and select "Reopen in Container." VS Code will now build and launch a Docker container based on the configuration in `devcontainer.json`.  

*Develop in the DevContainer:* You are now working inside the DevContainer. You can use all the Go tools and extensions available in the container. Open a terminal within VS Code and run Go commands, build your project, and debug as needed.

```zsh
workspace $ make run
```

*Accessing the Application:* If your Go application runs a web server on port 8080, you can manual specified in the DevContainer configuration at portsAttributes or may let devcontainer auto detect and forwarded port for you. After that you can access it by opening your browser and navigating to <http://localhost:8080>.

## The purposes and benefits of using DevContainers

Consistency: DevContainers ensure that all team members are working in the same development environment. This consistency reduces the likelihood of "it works on my machine" issues, as everyone is using the same tools, dependencies, and configurations.

Isolation: DevContainers are typically based on Docker containers, which provide isolation from the host system. This isolation means that the development environment is self-contained and does not interfere with other software or configurations on the developer's machine.

Reproducibility: DevContainers make it easy to reproduce the development environment on different machines or for different projects. This is particularly valuable when setting up new development environments, onboarding new team members, or when switching between projects with different dependencies.

Portability: With DevContainers, you can package the entire development environment (including dependencies, tools, and configurations) into version-controlled files. This makes it easy to share the development environment with others, ensuring that they can quickly get started on the project.

Editor Integration: DevContainers are often used in combination with code editors like VS Code, allowing developers to seamlessly open and work on projects in an isolated environment directly from their editor. This integration streamlines the development workflow.

Security: DevContainers can help enhance security by isolating development dependencies from the host system. This isolation reduces the risk of conflicts or vulnerabilities that might affect the host machine.

Scalability: DevContainers can be used in cloud-based development environments like GitHub Codespaces, making it possible to develop and test code in scalable and cloud-hosted environments, which can be particularly useful for larger projects or projects with complex infrastructure requirements.

Version Control: DevContainer configurations can be version-controlled alongside your project's source code. This ensures that the development environment is versioned and synchronized with the codebase.

Customization: DevContainers are highly customizable. You can tailor the container's configuration to match the specific needs of your project, including selecting the base image, installing additional tools, and configuring development settings.

## References

- [Devcontainer concept and Quick start](https://code.visualstudio.com/docs/devcontainers/containers)
- [Devcontainer image from Microsoft](https://mcr.microsoft.com/en-us/product/devcontainers/go/about)
- [Devcontainer: Use Docker Compose](https://code.visualstudio.com/docs/devcontainers/create-dev-container#_use-docker-compose)
- [Devcontainer official project template](https://github.com/devcontainers/templates/tree/main/src)
