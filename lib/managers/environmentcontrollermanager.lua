EnvironmentControllerManager = EnvironmentControllerManager or class(CoreEnvironmentControllerManager)

function EnvironmentControllerManager:init()
	EnvironmentControllerManager.super.init(self)
end

function EnvironmentControllerManager:set_dof_setting(setting)
	EnvironmentControllerManager.super.set_dof_setting(self, setting)
end

CoreClass.override_class(CoreEnvironmentControllerManager, EnvironmentControllerManager)

