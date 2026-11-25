
































import Proving.USC.Common.Predicates

namespace Proving.USC.T42.TitleVI.Bridge

open Proving.USC.Common








opaque Program : Type
opaque Agency  : Type
opaque State   : Type

axiom mapProgramEntity : Program → Entity
axiom mapStatePerson   : State → Person
axiom mapAgencyEntity  : Agency → Entity







namespace S2000d




structure Spine (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  funded  : IsFederalFundingRecipient e c
  person  : IsPersonInUS p c
  intent  : IntentToDiscriminate p c






opaque ElemProgram : Type
axiom elemMapEntity : ElemProgram → Entity
axiom SufferedCoveredAdverseAction (p : Person) (pr : ElemProgram) (c : ComplaintText) : Prop
axiom OnProtectedGround (p : Person) (c : ComplaintText) : Prop

structure ElemSection2000d (p : Person) (e : Entity) (pr : ElemProgram) (c : ComplaintText) : Prop where
  personInUS      : IsPersonInUS p c
  fundedProgram   : IsFederalFundingRecipient e c
  adverseAction   : SufferedCoveredAdverseAction p pr c
  protectedGround : OnProtectedGround p c
  intent          : IntentToDiscriminate p c
  timely          : WithinLimitations p c


theorem elements_implies_spine {p e pr c} (h : ElemSection2000d p e pr c) :
    Spine p e c :=
  ⟨h.fundedProgram, h.personInUS, h.intent⟩








axiom AddresseeInClass2000d (e : Entity) (c : ComplaintText) : Prop
axiom RegulatedActOccurred2000d (p : Person) (c : ComplaintText) : Prop
axiom ConditionFederalAssistance2000d (e : Entity) (c : ComplaintText) : Prop

structure DeonProhibition2000d (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  addressee : AddresseeInClass2000d e c
  act       : RegulatedActOccurred2000d p c
  condition : ConditionFederalAssistance2000d e c

axiom corr_deon_funded {e c} : ConditionFederalAssistance2000d e c → IsFederalFundingRecipient e c
axiom corr_deon_person {p c} : RegulatedActOccurred2000d p c → IsPersonInUS p c
axiom corr_deon_intent {p c} : RegulatedActOccurred2000d p c → IntentToDiscriminate p c


theorem deontic_implies_spine {p e c} (h : DeonProhibition2000d p e c) :
    Spine p e c :=
  ⟨corr_deon_funded h.condition, corr_deon_person h.act, corr_deon_intent h.act⟩




axiom HasPrivateRightOfAction (p : Person) (c : ComplaintText) : Prop
axiom IsIntentionalDiscriminationTheory (p : Person) (c : ComplaintText) : Prop
axiom InjuryCognizable (p : Person) (c : ComplaintText) : Prop
axiom CausedByViolation (p : Person) (c : ComplaintText) : Prop

structure RemStanding2000d (p : Person) (e : Entity) (c : ComplaintText) : Prop where
  privateRight     : HasPrivateRightOfAction p c
  intentional      : IsIntentionalDiscriminationTheory p c
  injury           : InjuryCognizable p c
  causation        : CausedByViolation p c
  fundingRecipient : IsFederalFundingRecipient e c

axiom corr_rem_person {p c} : HasPrivateRightOfAction p c → IsPersonInUS p c
axiom corr_rem_intent {p c} : IsIntentionalDiscriminationTheory p c → IntentToDiscriminate p c


theorem remedy_implies_spine {p e c} (h : RemStanding2000d p e c) :
    Spine p e c :=
  ⟨h.fundingRecipient, corr_rem_person h.privateRight, corr_rem_intent h.intentional⟩






axiom ScienterReachesSpecific (p : Person) (c : ComplaintText) : Prop

axiom corr_sci_intent {p c} : ScienterReachesSpecific p c → IntentToDiscriminate p c




theorem scienter_implies_intent {p c} (h : ScienterReachesSpecific p c) :
    IntentToDiscriminate p c :=
  corr_sci_intent h





axiom ActInWindow2000d (p : Person) (c : ComplaintText) : Prop
axiom ActIsPostEnactment2000d (p : Person) (c : ComplaintText) : Prop

axiom corr_time_limitations {p c} : ActInWindow2000d p c → ActIsPostEnactment2000d p c →
    WithinLimitations p c



theorem intertemporal_implies_timeliness {p c} (hw : ActInWindow2000d p c)
    (he : ActIsPostEnactment2000d p c) : WithinLimitations p c :=
  corr_time_limitations hw he





axiom EvidIsFederalFundingRecipient (e : Entity) (c : ComplaintText) : Prop
axiom EvidBurdenCarriedDiscrimination (p : Person) (c : ComplaintText) : Prop

axiom corr_evid_funded {e c} : EvidIsFederalFundingRecipient e c → IsFederalFundingRecipient e c
axiom corr_evid_intent {p c} : EvidBurdenCarriedDiscrimination p c → IntentToDiscriminate p c





theorem evidentiary_implies_funding_intent {p e c}
    (hf : EvidIsFederalFundingRecipient e c) (hb : EvidBurdenCarriedDiscrimination p c)
    (hp : IsPersonInUS p c) : Spine p e c :=
  ⟨corr_evid_funded hf, hp, corr_evid_intent hb⟩

end S2000d








namespace S2000d1



structure Spine (e : Entity) (c : ComplaintText) : Prop where
  funded      : IsFederalFundingRecipient e c
  enforcement : True



structure FundedCore (e : Entity) (c : ComplaintText) : Prop where
  funded : IsFederalFundingRecipient e c




axiom ValidAgencyEnforcementAction (e : Entity) (c : ComplaintText) : Prop

structure ElemSection2000d1 (e : Entity) (c : ComplaintText) : Prop where
  fundedProgram    : IsFederalFundingRecipient e c
  validEnforcement : ValidAgencyEnforcementAction e c


theorem elements_implies_core {e c} (h : ElemSection2000d1 e c) : FundedCore e c :=
  ⟨h.fundedProgram⟩





axiom IsCoveredRecipient (e : Entity) (c : ComplaintText) : Prop

axiom corr_proc_funded {e c} : IsCoveredRecipient e c → IsFederalFundingRecipient e c

structure ProcLawfulFundTermination (e : Entity) (c : ComplaintText) : Prop where
  covered : IsCoveredRecipient e c





theorem procedure_implies_core {e c} (h : ProcLawfulFundTermination e c) : FundedCore e c :=
  ⟨corr_proc_funded h.covered⟩




axiom AgencyCompliancePredicateMet (e : Entity) (c : ComplaintText) : Prop

structure RemAgencyEnforcement2000d1 (e : Entity) (c : ComplaintText) : Prop where
  fundingRecipient    : IsFederalFundingRecipient e c
  compliancePredicate : AgencyCompliancePredicateMet e c


theorem remedy_implies_core {e c} (h : RemAgencyEnforcement2000d1 e c) : FundedCore e c :=
  ⟨h.fundingRecipient⟩




axiom EvidFunded2000d1 (e : Entity) (c : ComplaintText) : Prop

axiom corr_evid1_funded {e c} : EvidFunded2000d1 e c → IsFederalFundingRecipient e c

structure EvidProof2000d1 (e : Entity) (c : ComplaintText) : Prop where
  recipient : EvidFunded2000d1 e c



theorem evidentiary_implies_core {e c} (h : EvidProof2000d1 e c) : FundedCore e c :=
  ⟨corr_evid1_funded h.recipient⟩







axiom SanctionExpressFinding (c : ComplaintText) : Prop
axiom SanctionVoluntaryFailed (c : ComplaintText) : Prop
axiom SharedExpressFinding (c : ComplaintText) : Prop

axiom corr_sanc_finding {c} : SanctionExpressFinding c → SharedExpressFinding c

structure SancSanction2000d1 (c : ComplaintText) : Prop where
  finding   : SanctionExpressFinding c
  voluntary : SanctionVoluntaryFailed c



theorem sanction_implies_finding {c} (h : SancSanction2000d1 c) : SharedExpressFinding c :=
  corr_sanc_finding h.finding

end S2000d1








namespace S2000d7




axiom ImmunityAbrogated (p : Person) (c : ComplaintText) : Prop

axiom AfterEffective (p : Person) (c : ComplaintText) : Prop



structure Spine (p : Person) (c : ComplaintText) : Prop where
  immunityAbrogated : ImmunityAbrogated p c
  afterEffective    : AfterEffective p c




axiom ElemSovereignImmunityAbrogated (p : Person) (c : ComplaintText) : Prop
axiom ElemViolationAfterEffectiveDate (p : Person) (c : ComplaintText) : Prop

axiom corr_elem_abrog {p c} : ElemSovereignImmunityAbrogated p c → ImmunityAbrogated p c
axiom corr_elem_after {p c} : ElemViolationAfterEffectiveDate p c → AfterEffective p c

structure ElemSection2000dState (p : Person) (c : ComplaintText) : Prop where
  immunityAbrogated : ElemSovereignImmunityAbrogated p c
  afterEffective    : ElemViolationAfterEffectiveDate p c


theorem elements_implies_spine {p c} (h : ElemSection2000dState p c) : Spine p c :=
  ⟨corr_elem_abrog h.immunityAbrogated, corr_elem_after h.afterEffective⟩





axiom DeonAddresseeState (s : State) (c : ComplaintText) : Prop
axiom DeonConditionAfterEffective2000d7 (s : State) (c : ComplaintText) : Prop

axiom corr_deon7_abrog {s c} : DeonAddresseeState s c → ImmunityAbrogated (mapStatePerson s) c
axiom corr_deon7_after {s c} : DeonConditionAfterEffective2000d7 s c → AfterEffective (mapStatePerson s) c

structure DeonProhibition2000d7 (s : State) (c : ComplaintText) : Prop where
  addressee : DeonAddresseeState s c
  condition : DeonConditionAfterEffective2000d7 s c



theorem deontic_implies_spine {s c} (h : DeonProhibition2000d7 s c) :
    Spine (mapStatePerson s) c :=
  ⟨corr_deon7_abrog h.addressee, corr_deon7_after h.condition⟩




axiom RemStateImmunityAbrogated (p : Person) (c : ComplaintText) : Prop

axiom corr_rem7_abrog {p c} : RemStateImmunityAbrogated p c → ImmunityAbrogated p c




theorem remedy_implies_spine {p c} (h : RemStateImmunityAbrogated p c)
    (ha : AfterEffective p c) : Spine p c :=
  ⟨corr_rem7_abrog h, ha⟩




axiom SancDefendantIsState (p : Person) (c : ComplaintText) : Prop
axiom SancViolationAfterEffective (c : ComplaintText) : Prop

axiom corr_sanc7_abrog {p c} : SancDefendantIsState p c → ImmunityAbrogated p c
axiom corr_sanc7_after {p c} : SancViolationAfterEffective c → AfterEffective p c

structure SancSanction2000d7 (p : Person) (c : ComplaintText) : Prop where
  isState : SancDefendantIsState p c
  inTime  : SancViolationAfterEffective c



theorem sanction_implies_spine {p c} (h : SancSanction2000d7 p c) : Spine p c :=
  ⟨corr_sanc7_abrog h.isState, corr_sanc7_after h.inTime⟩





axiom IntViolationAfterAbrogationDate (p : Person) (c : ComplaintText) : Prop

axiom corr_int7_after {p c} : IntViolationAfterAbrogationDate p c → AfterEffective p c



theorem intertemporal_implies_after {p c} (h : IntViolationAfterAbrogationDate p c) :
    AfterEffective p c :=
  corr_int7_after h





axiom EvidStateImmunityAbrogated (p : Person) (c : ComplaintText) : Prop

axiom corr_evid7_abrog {p c} : EvidStateImmunityAbrogated p c → ImmunityAbrogated p c




theorem evidentiary_implies_spine {p c} (h : EvidStateImmunityAbrogated p c)
    (ha : AfterEffective p c) : Spine p c :=
  ⟨corr_evid7_abrog h, ha⟩

end S2000d7

end Proving.USC.T42.TitleVI.Bridge
