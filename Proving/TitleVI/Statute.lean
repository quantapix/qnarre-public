










import Proving.TitleVI.Predicates

namespace Proving.TitleVI







structure TitleVICoverage
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  personInUS         : IsPersonInUS plaintiff c
  notInstrumentality : NotAStateInstrumentality plaintiff c
  recipient          : IsRecipient defendant c
  receivesFFA        : ReceivesFederalFinancialAssistance defendant c
  programOfRecipient : IsProgramOfRecipient pr defendant c
  underProgram       : OccursUnderProgram a pr c






structure IntentionalDiscriminationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage    : TitleVICoverage plaintiff defendant pr a c
  directed    : ActionDirectedAtPerson a plaintiff c
  intentional : IntentionalDiscrimination a g c
  officialCap : DefendantSuedInOfficialCapacity defendant c




































inductive JustificationDefeated (a : Action) (c : ComplaintText) : Prop where
  | lacksJustification
      (h : LacksSubstantialLegitimateJustification a c) : JustificationDefeated a c
  | lessDiscriminatoryAlternative
      (h : LessDiscriminatoryAlternativeAvailable a c) : JustificationDefeated a c









structure DisparateImpactClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage             : TitleVICoverage plaintiff defendant pr a c
  facialNeutrality     : IsFaciallyNeutralPolicy a c
  adverseImpact        : AdverseDisparateImpact a g c
  causalLink           : CausalLinkBetweenPolicyAndImpact a c
  justificationDefeated : JustificationDefeated a c







structure RetaliationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage     : TitleVICoverage plaintiff defendant pr a c
  protectedAct : ProtectedActivity plaintiff c
  adverse      : AdverseAction a plaintiff c
  causal       : RetaliatoryCausation a plaintiff c
  officialCap  : DefendantSuedInOfficialCapacity defendant c







inductive ValidTitleVIComplaint
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidTitleVIComplaint plaintiff defendant c
  | viaDisparateImpact
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : DisparateImpactClaim plaintiff defendant pr a g c) :
      ValidTitleVIComplaint plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidTitleVIComplaint plaintiff defendant c







inductive ValidTitleVIJudicialClaim
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidTitleVIJudicialClaim plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidTitleVIJudicialClaim plaintiff defendant c

end Proving.TitleVI
