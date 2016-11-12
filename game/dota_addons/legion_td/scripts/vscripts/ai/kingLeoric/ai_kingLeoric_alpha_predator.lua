require("ai/ai_core")

function Spawn(entity)
    InitAI(thisEntity)
end

function InitAI( self )
	self:SetContextThink( "init_think", function()
		self.aiThink = aiThinkStandardSkill
		self.CheckIfHasAggro = CheckIfHasAggro
		self.ability = {}
		self.ability[1] = self:FindAbilityByName("kingLeoric_spiked_carapace")
		self.ability[1].Skill = UseSkillNoTarget
		self.ability[2] = self:FindAbilityByName("kingLeoric_snot_spray")
		self.ability[2].Skill = UseSkillOnTarget
		self.Unstuck = Unstuck
		self:SetContextThink( "ai_alpha_predator.aiThink", Dynamic_Wrap( self, "aiThink" ), 0 )
	end, 0 )
end