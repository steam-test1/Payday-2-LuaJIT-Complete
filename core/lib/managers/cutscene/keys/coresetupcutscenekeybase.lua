require("core/lib/managers/cutscene/keys/CoreCutsceneKeyBase")

CoreSetupCutsceneKeyBase = CoreSetupCutsceneKeyBase or class(CoreCutsceneKeyBase)

function CoreSetupCutsceneKeyBase:populate_from_editor(cutscene_editor)
	return
end

function CoreSetupCutsceneKeyBase:frame()
	return 0
end

function CoreSetupCutsceneKeyBase:set_frame(frame)
	return
end

function CoreSetupCutsceneKeyBase:on_gui_representation_changed(sender, sequencer_clip)
	return
end

function CoreSetupCutsceneKeyBase:prime(player)
	error("Cutscene keys deriving from CoreSetupCutsceneKeyBase must define the \"prime\" method.")
end

function CoreSetupCutsceneKeyBase:play(player, undo, fast_forward)
	return
end
