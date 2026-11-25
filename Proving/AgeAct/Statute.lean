












import Proving.AgeAct.Predicates

namespace Proving.AgeAct







structure AgeActCoverage
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  personInUS         : IsPersonInUS plaintiff c
  notInstrumentality : NotAStateInstrumentality plaintiff c
  recipient          : IsRecipient defendant c
  receivesFFA        : ReceivesFederalFinancialAssistance defendant c
  programOfRecipient : IsProgramOfRecipient pr defendant c
  underProgram       : OccursUnderProgram a pr c
  outsideExceptions  : OutsideAgeActExceptions a pr c






structure IntentionalDiscriminationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage    : AgeActCoverage plaintiff defendant pr a c
  directed    : ActionDirectedAtPerson a plaintiff c
  intentional : IntentionalAgeDiscrimination a g c
  officialCap : DefendantSuedInOfficialCapacity defendant c







structure DisparateImpactClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  coverage           : AgeActCoverage plaintiff defendant pr a c
  facialNeutrality   : IsFaciallyNeutralPolicy a c
  adverseImpact      : AdverseDisparateImpact a g c
  causalLink         : CausalLinkBetweenPolicyAndImpact a c
  lacksJustification : LacksSubstantialLegitimateJustification a c





structure RetaliationClaim
    (plaintiff : Person) (defendant : Recipient)
    (pr : Program) (a : Action) (c : ComplaintText) : Prop where
  coverage     : AgeActCoverage plaintiff defendant pr a c
  protectedAct : ProtectedActivity plaintiff c
  adverse      : AdverseAction a plaintiff c
  causal       : RetaliatoryCausation a plaintiff c
  officialCap  : DefendantSuedInOfficialCapacity defendant c



inductive ValidAgeActComplaint
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidAgeActComplaint plaintiff defendant c
  | viaDisparateImpact
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : DisparateImpactClaim plaintiff defendant pr a g c) :
      ValidAgeActComplaint plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidAgeActComplaint plaintiff defendant c







inductive ValidAgeActJudicialClaim
    (plaintiff : Person) (defendant : Recipient) (c : ComplaintText) : Prop where
  | viaIntentional
      (pr : Program) (a : Action) (g : ProtectedGround)
      (h : IntentionalDiscriminationClaim plaintiff defendant pr a g c) :
      ValidAgeActJudicialClaim plaintiff defendant c
  | viaRetaliation
      (pr : Program) (a : Action)
      (h : RetaliationClaim plaintiff defendant pr a c) :
      ValidAgeActJudicialClaim plaintiff defendant c

end Proving.AgeAct
