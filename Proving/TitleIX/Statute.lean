













import Proving.TitleIX.Predicates

namespace Proving.TitleIX








structure TitleIXCoverage
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  personInUS         : IsPersonInUS plaintiff c
  notInstrumentality : NotAStateInstrumentality plaintiff c
  recipient          : IsRecipient defendant c
  receivesFFA        : ReceivesFederalFinancialAssistance defendant c
  educationProgram   : IsEducationProgramOfRecipient pr defendant c
  underProgram       : OccursUnderProgram a pr c
  notExcepted        : NotWithinStatutoryException a pr c






structure IntentionalDiscriminationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage    : TitleIXCoverage plaintiff defendant pr a c
  directed    : ActionDirectedAtPerson a plaintiff c
  intentional : IntentionalDiscrimination a g c
  officialCap : DefendantSuedInOfficialCapacity defendant c







structure DisparateImpactClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage           : TitleIXCoverage plaintiff defendant pr a c
  facialNeutrality   : IsFaciallyNeutralPolicy a c
  adverseImpact      : AdverseDisparateImpact a g c
  causalLink         : CausalLinkBetweenPolicyAndImpact a c
  lacksJustification : LacksSubstantialLegitimateJustification a c







structure RetaliationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage     : TitleIXCoverage plaintiff defendant pr a c
  protectedAct : ProtectedActivity plaintiff c
  adverse      : AdverseAction a plaintiff c
  causal       : RetaliatoryCausation a plaintiff c
  officialCap  : DefendantSuedInOfficialCapacity defendant c







structure DeliberateIndifferenceClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage        : TitleIXCoverage plaintiff defendant pr a c
  harassment      : SexualHarassmentSevereePervasive a plaintiff c
  actualKnowledge : RecipientHadActualKnowledge a c
  indifference    : DeliberateIndifference a c
  control         : SubstantialControlOverHarasserAndContext a c
  officialCap     : DefendantSuedInOfficialCapacity defendant c






inductive ValidTitleIXComplaint
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidTitleIXComplaint plaintiff defendant c
  | viaDisparateImpact
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : DisparateImpactClaim plaintiff defendant pr a g c) :
      ValidTitleIXComplaint plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidTitleIXComplaint plaintiff defendant c
  | viaDeliberateIndifference
      (pr : Program) (a : Action)
      (h : DeliberateIndifferenceClaim plaintiff defendant pr a c) :
      ValidTitleIXComplaint plaintiff defendant c







inductive ValidTitleIXJudicialClaim
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidTitleIXJudicialClaim plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidTitleIXJudicialClaim plaintiff defendant c
  | viaDeliberateIndifference
      (pr : Program) (a : Action)
      (h : DeliberateIndifferenceClaim plaintiff defendant pr a c) :
      ValidTitleIXJudicialClaim plaintiff defendant c

end Proving.TitleIX
