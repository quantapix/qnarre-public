














import Proving.Rehab504.Predicates

namespace Proving.Rehab504








structure Rehab504Coverage
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  qualifiedIndividual  : IsQualifiedIndividualWithDisability plaintiff c
  notInstrumentality   : NotAStateInstrumentality plaintiff c
  recipient            : IsRecipient defendant c
  assistedOrConducted  : FederallyAssistedOrConducted defendant c
  programOfRecipient   : IsProgramOfRecipient pr defendant c
  underProgram         : OccursUnderProgram a pr c






structure IntentionalDiscriminationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage    : Rehab504Coverage plaintiff defendant pr a c
  directed    : ActionDirectedAtPerson a plaintiff c
  solelyByReason : SolelyByReasonOfDisability a g c
  officialCap : DefendantSuedInOfficialCapacity defendant c






structure FailureToAccommodateClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage       : Rehab504Coverage plaintiff defendant pr a c
  needed         : NeededReasonableAccommodation a plaintiff c
  reasonable     : AccommodationReasonableNotFundamentalAlteration a c
  deniedAccess   : RecipientDeniedMeaningfulAccess a plaintiff c
  officialCap    : DefendantSuedInOfficialCapacity defendant c







structure DisparateImpactClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage           : Rehab504Coverage plaintiff defendant pr a c
  facialNeutrality   : IsFaciallyNeutralPolicy a c
  adverseImpact      : AdverseDisparateImpact a g c
  causalLink         : CausalLinkBetweenPolicyAndImpact a c
  lacksJustification : LacksSubstantialLegitimateJustification a c





structure RetaliationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage     : Rehab504Coverage plaintiff defendant pr a c
  protectedAct : ProtectedActivity plaintiff c
  adverse      : AdverseAction a plaintiff c
  causal       : RetaliatoryCausation a plaintiff c
  officialCap  : DefendantSuedInOfficialCapacity defendant c



inductive ValidRehab504Complaint
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidRehab504Complaint plaintiff defendant c
  | viaFailureToAccommodate
      (pr : Program) (a : Action)
      (h : FailureToAccommodateClaim plaintiff defendant pr a c) :
      ValidRehab504Complaint plaintiff defendant c
  | viaDisparateImpact
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : DisparateImpactClaim plaintiff defendant pr a g c) :
      ValidRehab504Complaint plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidRehab504Complaint plaintiff defendant c







inductive ValidRehab504JudicialClaim
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidRehab504JudicialClaim plaintiff defendant c
  | viaFailureToAccommodate
      (pr : Program) (a : Action)
      (h : FailureToAccommodateClaim plaintiff defendant pr a c) :
      ValidRehab504JudicialClaim plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidRehab504JudicialClaim plaintiff defendant c

end Proving.Rehab504
