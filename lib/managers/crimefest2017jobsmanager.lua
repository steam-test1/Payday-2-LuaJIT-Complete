Crimefest2017JobsManager = Crimefest2017JobsManager or class(SideJobGenericDLCManager)
Crimefest2017JobsManager.save_version = 1
Crimefest2017JobsManager.global_table_name = "cf2017_jobs"
Crimefest2017JobsManager.save_table_name = "cf2017_jobs"
Crimefest2017JobsManager.category = "cf2017_jobs"
Crimefest2017JobsManager.category_id = "menu_cf2017_jobs"

function Crimefest2017JobsManager:init()
	self._challenges_tweak_data = tweak_data.crimefest_2017_jobs.challenges

	self:_setup()
end

