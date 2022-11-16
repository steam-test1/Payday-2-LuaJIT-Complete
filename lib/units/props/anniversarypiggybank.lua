AnniversaryPiggyBank = AnniversaryPiggyBank or class(UnitBase)

function AnniversaryPiggyBank:init(unit)
	AnniversaryPiggyBank.super.init(self, unit, false)

	if managers.mutators:is_mutator_active(MutatorPiggyBank) then
		self._piggybank_mutator = managers.mutators:get_mutator(MutatorPiggyBank)
	end
end

function AnniversaryPiggyBank:sync_feed_pig()
	managers.menu:post_event("bar_armor_finished")
end

function AnniversaryPiggyBank:explode_pig(unit)
	self._piggybank_mutator:on_pig_exploded(unit)
end

function AnniversaryPiggyBank:sync_explode_pig(pig_level)
end

function AnniversaryPiggyBank:on_interacted()
	if not Network:is_server() then
		return
	end

	self:explode_pig()
end

function AnniversaryPiggyBank:run_sequence(sequence)
	print("AnniversaryPiggyBank:run_sequence", sequence, self._unit)

	if sequence and self._unit:damage():has_sequence(sequence) then
		self._unit:damage():run_sequence_simple(sequence)
	end
end
