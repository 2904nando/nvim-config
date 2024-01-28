local setup, project = pcall(require, "project")
if not setup then
	return
end

project.setup()
