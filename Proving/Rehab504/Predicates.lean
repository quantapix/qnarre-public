













import Proving.Rehab504.Types

namespace Proving.Rehab504









axiom IsQualifiedIndividualWithDisability (p : Person) (c : ComplaintText) : Prop



axiom NotAStateInstrumentality (p : Person) (c : ComplaintText) : Prop




axiom IsRecipient (r : Recipient) (c : ComplaintText) : Prop






axiom FederallyAssistedOrConducted (r : Recipient) (c : ComplaintText) : Prop




axiom IsProgramOfRecipient (pr : Program) (r : Recipient) (c : ComplaintText) : Prop



axiom OccursUnderProgram (a : Action) (pr : Program) (c : ComplaintText) : Prop




axiom DefendantSuedInOfficialCapacity (r : Recipient) (c : ComplaintText) : Prop





axiom ActionDirectedAtPerson (a : Action) (p : Person) (c : ComplaintText) : Prop





axiom SolelyByReasonOfDisability (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop










axiom NeededReasonableAccommodation (a : Action) (p : Person) (c : ComplaintText) : Prop




axiom AccommodationReasonableNotFundamentalAlteration (a : Action) (c : ComplaintText) : Prop



axiom RecipientDeniedMeaningfulAccess (a : Action) (p : Person) (c : ComplaintText) : Prop




axiom IsFaciallyNeutralPolicy (a : Action) (c : ComplaintText) : Prop



axiom AdverseDisparateImpact (a : Action) (g : ProtectedGround) (c : ComplaintText) : Prop



axiom CausalLinkBetweenPolicyAndImpact (a : Action) (c : ComplaintText) : Prop



axiom LacksSubstantialLegitimateJustification (a : Action) (c : ComplaintText) : Prop






axiom ProtectedActivity (p : Person) (c : ComplaintText) : Prop



axiom AdverseAction (a : Action) (p : Person) (c : ComplaintText) : Prop



axiom RetaliatoryCausation (a : Action) (p : Person) (c : ComplaintText) : Prop

end Proving.Rehab504
