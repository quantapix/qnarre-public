














import Proving.TitleIX.Types

namespace Proving.TitleIX





axiom IsPersonInUS (p : Person) (c : ComplaintText) : Prop




axiom NotAStateInstrumentality (p : Person) (c : ComplaintText) : Prop




axiom IsRecipient (r : Recipient) (c : ComplaintText) : Prop



axiom ReceivesFederalFinancialAssistance (r : Recipient) (c : ComplaintText) : Prop






axiom IsEducationProgramOfRecipient (pr : Program) (r : Recipient) (c : ComplaintText) : Prop



axiom OccursUnderProgram (a : Action) (pr : Program) (c : ComplaintText) : Prop









axiom NotWithinStatutoryException (a : Action) (pr : Program) (c : ComplaintText) : Prop



axiom DefendantSuedInOfficialCapacity (r : Recipient) (c : ComplaintText) : Prop





axiom ActionDirectedAtPerson (a : Action) (p : Person) (c : ComplaintText) : Prop





axiom IntentionalDiscrimination (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop




axiom IsFaciallyNeutralPolicy (a : Action) (c : ComplaintText) : Prop



axiom AdverseDisparateImpact (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop



axiom CausalLinkBetweenPolicyAndImpact (a : Action) (c : ComplaintText) : Prop



axiom LacksSubstantialLegitimateJustification (a : Action) (c : ComplaintText) : Prop






axiom ProtectedActivity (p : Person) (c : ComplaintText) : Prop



axiom AdverseAction (a : Action) (p : Person) (c : ComplaintText) : Prop




axiom RetaliatoryCausation (a : Action) (p : Person) (c : ComplaintText) : Prop












axiom SexualHarassmentSevereePervasive (a : Action) (p : Person) (c : ComplaintText) : Prop




axiom RecipientHadActualKnowledge (a : Action) (c : ComplaintText) : Prop




axiom DeliberateIndifference (a : Action) (c : ComplaintText) : Prop




axiom SubstantialControlOverHarasserAndContext (a : Action) (c : ComplaintText) : Prop

end Proving.TitleIX
