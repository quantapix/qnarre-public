













import Proving.AgeAct.Types

namespace Proving.AgeAct





axiom IsPersonInUS (p : Person) (c : ComplaintText) : Prop



axiom NotAStateInstrumentality (p : Person) (c : ComplaintText) : Prop




axiom IsRecipient (r : Recipient) (c : ComplaintText) : Prop



axiom ReceivesFederalFinancialAssistance (r : Recipient) (c : ComplaintText) : Prop



axiom IsProgramOfRecipient (pr : Program) (r : Recipient) (c : ComplaintText) : Prop



axiom OccursUnderProgram (a : Action) (pr : Program) (c : ComplaintText) : Prop











axiom OutsideAgeActExceptions (a : Action) (pr : Program) (c : ComplaintText) : Prop




axiom DefendantSuedInOfficialCapacity (r : Recipient) (c : ComplaintText) : Prop





axiom ActionDirectedAtPerson (a : Action) (p : Person) (c : ComplaintText) : Prop



axiom IntentionalAgeDiscrimination (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop




axiom IsFaciallyNeutralPolicy (a : Action) (c : ComplaintText) : Prop



axiom AdverseDisparateImpact (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop



axiom CausalLinkBetweenPolicyAndImpact (a : Action) (c : ComplaintText) : Prop



axiom LacksSubstantialLegitimateJustification (a : Action) (c : ComplaintText) : Prop






axiom ProtectedActivity (p : Person) (c : ComplaintText) : Prop



axiom AdverseAction (a : Action) (p : Person) (c : ComplaintText) : Prop



axiom RetaliatoryCausation (a : Action) (p : Person) (c : ComplaintText) : Prop

end Proving.AgeAct
