

























import Proving.USC.Common.Types
import Proving.USC.Common.Predicates
import Proving.USC.T18.Ch1.Part2.Elements.Theorems
import Proving.USC.T18.Ch1.Part2.Deontic.Theorems
import Proving.USC.T18.Ch1.Part2.Ontology.Theorems
import Proving.USC.T18.Ch1.Part2.Procedure.Theorems
import Proving.USC.T18.Ch1.Part2.Structure.Theorems

namespace Proving.USC.T18.Ch1.Part2.Bridge

open Proving.USC.Common







axiom offCorr : Ontology.Offense → Elements.Offense
axiom propCorr : Ontology.Property → Elements.Property
axiom courtCorr : Ontology.Court → Elements.Court
axiom fgsCorr : Ontology.ForeignGovernmentSecurity → Elements.Instrument
axiom seaportCorr : Ontology.Seaport → Elements.Place


axiom persEntCorr : Person → Entity










axiom corr17_proved_elements (p : Person) (c : ComplaintText) :
    Procedure.ProvedInsanityByClearAndConvincing p c →
      Elements.HasSevereMentalDiseaseOrDefect p c ∧
      Elements.InsanityCognitiveIncapacity p c ∧
      Elements.MentalDefectAtTimeOfOffense p c


axiom corr17_condition_elements (p : Person) (c : ComplaintText) :
    Deontic.ConditionMet17 p c →
      Elements.HasSevereMentalDiseaseOrDefect p c ∧
      Elements.InsanityCognitiveIncapacity p c ∧
      Elements.MentalDefectAtTimeOfOffense p c



axiom corr17_raised_addressee (p : Person) (c : ComplaintText) :
    Procedure.RaisedInsanityDefense p c → Deontic.AddresseeInClass17 p c


axiom corr17_proved_condition (p : Person) (c : ComplaintText) :
    Procedure.ProvedInsanityByClearAndConvincing p c → Deontic.ConditionMet17 p c

theorem s17_procedure_implies_elements {p : Person} {c : ComplaintText}
    (h : Procedure.EstablishInsanityDefense p c) : Elements.InsanityDefense p c :=
  let e := corr17_proved_elements p c h.burdenMet
  ⟨e.1, e.2.1, e.2.2⟩

theorem s17_deontic_implies_elements {p : Person} {c : ComplaintText}
    (h : Deontic.PermissionAvailable17 p c) : Elements.InsanityDefense p c :=
  match h with
  | ⟨_, cond⟩ =>
    let e := corr17_condition_elements p c cond
    ⟨e.1, e.2.1, e.2.2⟩

theorem s17_procedure_implies_deontic {p : Person} {c : ComplaintText}
    (h : Procedure.EstablishInsanityDefense p c) : Deontic.PermissionAvailable17 p c :=
  ⟨corr17_raised_addressee p c h.raised, corr17_proved_condition p c h.burdenMet⟩









axiom corr25_addressee_adult (p : Person) (c : ComplaintText) :
    Deontic.AddresseeInClass25 p c → Elements.IsAdultEighteenOrOlder p c
axiom corr25_act_uses (p : Person) (c : ComplaintText) :
    Deontic.RegulatedActOccurred25 p c → Elements.IntentionallyUsesMinor p c
axiom corr25_act_purpose (p : Person) (c : ComplaintText) :
    Deontic.RegulatedActOccurred25 p c → Elements.UseOfMinorPurpose p c
axiom corr25_condition_prosec (p : Person) (c : ComplaintText) :
    Deontic.ConditionMet25 p c → Elements.ProsecutableInCourtOfUnitedStates p c

theorem s25_deontic_implies_elements {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated25 p c) : Elements.Section25 p c :=
  ⟨corr25_addressee_adult p c h.1.addressee, corr25_act_uses p c h.2,
   corr25_act_purpose p c h.2, corr25_condition_prosec p c h.1.condition⟩

axiom corr25_conv_adult (p : Person) (c : ComplaintText) :
    Procedure.FirstConvictionUnderMinorUse p c → Elements.IsAdultEighteenOrOlder p c
axiom corr25_conv_uses (p : Person) (c : ComplaintText) :
    Procedure.FirstConvictionUnderMinorUse p c → Elements.IntentionallyUsesMinor p c
axiom corr25_conv_purpose (p : Person) (c : ComplaintText) :
    Procedure.FirstConvictionUnderMinorUse p c → Elements.UseOfMinorPurpose p c


axiom corr25_prosec_prosec (p : Person) (c : ComplaintText) :
    Procedure.ProsecutableInUSCourt p c → Elements.ProsecutableInCourtOfUnitedStates p c

theorem s25_procedure_implies_elements {p : Person} {c : ComplaintText}
    (h : Procedure.FirstConvictionPenaltyTrigger p c) : Elements.Section25 p c :=
  ⟨corr25_conv_adult p c h.firstConv, corr25_conv_uses p c h.firstConv,
   corr25_conv_purpose p c h.firstConv, corr25_prosec_prosec p c h.prosecutable⟩

axiom corr25_conv_addressee (p : Person) (c : ComplaintText) :
    Procedure.FirstConvictionUnderMinorUse p c → Deontic.AddresseeInClass25 p c
axiom corr25_prosec_condition (p : Person) (c : ComplaintText) :
    Procedure.ProsecutableInUSCourt p c → Deontic.ConditionMet25 p c
axiom corr25_conv_act (p : Person) (c : ComplaintText) :
    Procedure.FirstConvictionUnderMinorUse p c → Deontic.RegulatedActOccurred25 p c

theorem s25_procedure_implies_deontic {p : Person} {c : ComplaintText}
    (h : Procedure.FirstConvictionPenaltyTrigger p c) : Deontic.ProhibitionViolated25 p c :=
  ⟨⟨corr25_conv_addressee p c h.firstConv, corr25_prosec_condition p c h.prosecutable⟩,
   corr25_conv_act p c h.firstConv⟩









axiom corr28b_addressee (o : Elements.Offense) (p : Person) (c : ComplaintText) :
    Elements.IsCoveredFederalOffense o c → Deontic.AddresseeInClass28b p c
axiom corr28b_condition (p : Person) (c : ComplaintText) :
    Elements.WasVictimOfTrafficking p c → Elements.VictimStatusAtTimeOfOffense p c →
      Deontic.ConditionMet28b p c

theorem s28b_elements_implies_deontic {o : Elements.Offense} {p : Person} {c : ComplaintText}
    (h : Elements.TraffickingDuressDefense o p c) : Deontic.PermissionAvailable28b p c :=
  ⟨corr28b_addressee o p c h.coveredOffense, corr28b_condition p c h.victim h.atTime⟩








axiom corr15 (s : Ontology.ForeignGovernmentSecurity) (c : ComplaintText) :
    Ontology.IsObligationOrSecurityOfForeignGovernment s c →
      Elements.IsObligationOrSecurityOfForeignGovernment (fgsCorr s) c
theorem s15_ontology_implies_elements {s : Ontology.ForeignGovernmentSecurity} {c : ComplaintText}
    (h : Ontology.IsObligationOrSecurityOfForeignGovernment s c) :
    Elements.IsObligationOrSecurityOfForeignGovernment (fgsCorr s) c :=
  corr15 s c h


axiom corr16_force (o : Ontology.Offense) (c : ComplaintText) :
    Ontology.HasPhysicalForceElement o c → Elements.HasForceElement (offCorr o) c
axiom corr16_felonyrisk (o : Ontology.Offense) (c : ComplaintText) :
    Ontology.IsFelonyRiskingPhysicalForce o c →
      Elements.IsFelonyOffense (offCorr o) c ∧ Elements.ByNatureSubstantialRiskOfForce (offCorr o) c
theorem s16_ontology_implies_elements {o : Ontology.Offense} {c : ComplaintText}
    (h : Ontology.CrimeOfViolenceMembership o c) : Elements.CrimeOfViolence (offCorr o) c :=
  match h.witness with
  | .forceElement hf => .forceElement (corr16_force o c hf)
  | .felonyRisk hfr =>
      let fr := corr16_felonyrisk o c hfr
      .felonyRisk ⟨fr.1, fr.2⟩


axiom corr18_org (p : Person) (c : ComplaintText) :
    Ontology.IsOrganization p c → Elements.IsOrganization (persEntCorr p) c
theorem s18_ontology_implies_elements {p : Person} {c : ComplaintText}
    (h : Ontology.OrganizationMembership p c) : Elements.IsOrganization (persEntCorr p) c :=
  corr18_org p c h.member


axiom corr19_petty (o : Ontology.Offense) (c : ComplaintText) :
    Ontology.IsPettyOffense o c → Elements.IsPettyOffense (offCorr o) c
theorem s19_ontology_implies_elements {o : Ontology.Offense} {c : ComplaintText}
    (h : Ontology.PettyOffenseMembership o c) : Elements.IsPettyOffense (offCorr o) c :=
  corr19_petty o c h.member


axiom corr20_fi (e : Entity) (c : ComplaintText) :
    Ontology.IsFinancialInstitution e c → Elements.IsFinancialInstitution e c
theorem s20_ontology_implies_elements {e : Entity} {c : ComplaintText}
    (h : Ontology.FinancialInstitutionMembership e c) : Elements.IsFinancialInstitution e c :=
  corr20_fi e c h.member



axiom corr21_char (pr : Ontology.Property) (c : ComplaintText) :
    Ontology.WasStolenOrCounterfeited pr c →
      Elements.PropertyOfStolenOrCounterfeitCharacter (propCorr pr) c
theorem s21_ontology_implies_elements_modulo_gaps
    {pr : Ontology.Property} {p : Person} {c : ComplaintText}
    (gap_s21_scienter_carrier :
      Ontology.DefendantKnewStolenCharacter pr c → Elements.DefendantKnewStolenCharacter p c)
    (h : Ontology.StolenOrCounterfeitPropertyMembership pr c) :
    Elements.StolenPropertyElement (propCorr pr) p c :=
  ⟨corr21_char pr c h.stolen, gap_s21_scienter_carrier h.knew⟩


axiom corr23 (crt : Ontology.Court) (c : ComplaintText) :
    Ontology.IsCourtOfTheUnitedStates crt c → Elements.IsCourtOfTheUnitedStates (courtCorr crt) c
theorem s23_ontology_implies_elements {crt : Ontology.Court} {c : ComplaintText}
    (h : Ontology.IsCourtOfTheUnitedStates crt c) :
    Elements.IsCourtOfTheUnitedStates (courtCorr crt) c :=
  corr23 crt c h


axiom corr24_violates_listtwo (o : Ontology.Offense) (c : ComplaintText) :
    Ontology.ViolatesEnumeratedHealthCareStatute o c →
      Elements.ViolatesEnumeratedHealthOffenseListTwo (offCorr o) c
axiom corr24_relates (o : Ontology.Offense) (c : ComplaintText) :
    Ontology.RelatesToHealthCareBenefitProgram o c →
      Elements.RelatesToHealthCareBenefitProgram (offCorr o) c
theorem s24_ontology_implies_elements {o : Ontology.Offense} {c : ComplaintText}
    (h : Ontology.FederalHealthCareOffenseMembership o c) :
    Elements.FederalHealthCareOffense (offCorr o) c :=
  .listTwo (corr24_violates_listtwo o c h.violates) (corr24_relates o c h.relates)


axiom corr26 (s : Ontology.Seaport) (c : ComplaintText) :
    Ontology.IsSeaport s c → Elements.IsSeaport (seaportCorr s) c
theorem s26_ontology_implies_elements {s : Ontology.Seaport} {c : ComplaintText}
    (h : Ontology.IsSeaport s c) : Elements.IsSeaport (seaportCorr s) c :=
  corr26 s c h



axiom corr27_finances (p : Person) (c : ComplaintText) :
    Ontology.FinancesOrRefinancesRealEstateDebt p c →
      Elements.FinancesOrRefinancesRealEstateDebt (persEntCorr p) c
axiom corr27_commerce (p : Person) (c : ComplaintText) :
    Ontology.AffectsInterstateOrForeignCommerce p c →
      EngagedInInterstateCommerce (persEntCorr p) c
theorem s27_ontology_implies_elements {p : Person} {c : ComplaintText}
    (h : Ontology.MortgageLendingBusinessMembership p c) :
    Elements.MortgageLendingBusiness (persEntCorr p) c :=
  ⟨corr27_finances p c h.finances, corr27_commerce p c h.commerce⟩

end Proving.USC.T18.Ch1.Part2.Bridge
