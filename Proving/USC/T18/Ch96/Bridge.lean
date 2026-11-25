

















import Proving.USC.T18.Ch96.Elements.Statute
import Proving.USC.T18.Ch96.Deontic.Statute
import Proving.USC.T18.Ch96.Ontology.Statute
import Proving.USC.T18.Ch96.Procedure.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch96.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch96









axiom mapPerson_EO : Person → Ontology.Person
axiom mapEnt_EO    : Elements.Enterprise → Ontology.Enterprise
axiom mapPat_EO    : List Elements.RacketeeringAct → Ontology.Pattern
axiom mapProp_EO   : Elements.Property → Ontology.ForfeitableProperty


axiom mapProp_PE   : Procedure.Property → Elements.Property
axiom mapProp_PO   : Procedure.Property → Ontology.ForfeitableProperty
axiom mapDem_PE    : Procedure.CivilInvestigativeDemand → Elements.Demand
axiom mkCust_O     : ComplaintText → Ontology.RacketeerDocumentCustodian


axiom mapPerson_ER   : Person → Proving.Rico.Person
axiom mapEnt_ER      : Elements.Enterprise → Proving.Rico.Entity
axiom mapComplaint_ER : ComplaintText → Proving.Rico.ComplaintText
axiom mapActs_ER     : List Elements.RacketeeringAct → List Proving.Rico.Act
axiom mkActs_ER      : ComplaintText → List Proving.Rico.Act
axiom mkInvest_ER    : Elements.Income → Proving.Rico.Investment
axiom mkIC_ER        : ComplaintText → Proving.Rico.InterestOrControl
axiom mkAgreement_ER : ComplaintText → Proving.Rico.Agreement







axiom corr_ep_count {c : ComplaintText} :
    (2 ≤ Elements.RacketeeringActCount c) → Procedure.PatternActCountMet c
axiom corr_ep_within {c : ComplaintText} :
    (Elements.YearsBetweenPriorAndLastAct c ≤ 10) → Procedure.PatternWithinTenYears c
axiom corr_ep_eff {c : ComplaintText} :
    Elements.OneActAfterEffectiveDate c → Procedure.OneActAfterEffectiveDate c


theorem s1961_pattern_elements_implies_procedure
    {acts : List Elements.RacketeeringAct} {c : ComplaintText}
    (h : Elements.PatternOfRacketeering acts c) : Procedure.PatternTiming c :=
  ⟨corr_ep_count h.atLeastTwoActs, corr_ep_within h.withinTenYears, corr_ep_eff h.oneAfterEffectiveDate⟩

axiom corr_eo_count {acts : List Elements.RacketeeringAct} {c : ComplaintText} :
    (2 ≤ Elements.RacketeeringActCount c) → 2 ≤ Ontology.racketeeringActCount (mapPat_EO acts) c
axiom corr_eo_eff {acts : List Elements.RacketeeringAct} {c : ComplaintText} :
    Elements.OneActAfterEffectiveDate c → Ontology.OneActAfterEffectiveDate (mapPat_EO acts) c
axiom corr_eo_within {acts : List Elements.RacketeeringAct} {c : ComplaintText} :
    (Elements.YearsBetweenPriorAndLastAct c ≤ 10) → Ontology.priorToLastActSpanYears (mapPat_EO acts) c ≤ 10


theorem s1961_pattern_elements_implies_ontology
    {acts : List Elements.RacketeeringAct} {c : ComplaintText}
    (h : Elements.PatternOfRacketeering acts c) : Ontology.PatternMembership (mapPat_EO acts) c :=
  ⟨corr_eo_count h.atLeastTwoActs, corr_eo_eff h.oneAfterEffectiveDate, corr_eo_within h.withinTenYears⟩

axiom corr_op_count {pat : Ontology.Pattern} {c : ComplaintText} :
    (2 ≤ Ontology.racketeeringActCount pat c) → Procedure.PatternActCountMet c
axiom corr_op_within {pat : Ontology.Pattern} {c : ComplaintText} :
    (Ontology.priorToLastActSpanYears pat c ≤ 10) → Procedure.PatternWithinTenYears c
axiom corr_op_eff {pat : Ontology.Pattern} {c : ComplaintText} :
    Ontology.OneActAfterEffectiveDate pat c → Procedure.OneActAfterEffectiveDate c


theorem s1961_pattern_ontology_implies_procedure
    {pat : Ontology.Pattern} {c : ComplaintText}
    (h : Ontology.PatternMembership pat c) : Procedure.PatternTiming c :=
  ⟨corr_op_count h.atLeastTwoActs, corr_op_within h.withinTenYears, corr_op_eff h.oneAfterEffective⟩


def s1961_tierA_pairwise : Prop :=
  (∀ {acts c}, Elements.PatternOfRacketeering acts c → Procedure.PatternTiming c)
  ∧ (∀ {acts c}, Elements.PatternOfRacketeering acts c → Ontology.PatternMembership (mapPat_EO acts) c)
  ∧ (∀ {pat c},  Ontology.PatternMembership pat c → Procedure.PatternTiming c)

theorem s1961_tierA : s1961_tierA_pairwise :=
  ⟨fun h => s1961_pattern_elements_implies_procedure h,
   fun h => s1961_pattern_elements_implies_ontology h,
   fun h => s1961_pattern_ontology_implies_procedure h⟩






axiom corr_d_addressee {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.EmployedOrAssociated p e c → Deontic.AddresseeInClass Deontic.NormId.s1962c p c
axiom corr_d_condition {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.EngagedInInterstateCommerce e c → Deontic.ConditionMet Deontic.NormId.s1962c c
axiom corr_d_act {p : Person} {e : Elements.Enterprise} {acts : List Elements.RacketeeringAct}
    {d : Elements.UnlawfulDebt} {c : ComplaintText} :
    Elements.ConductsOrParticipates p e c → Elements.PatternOrUnlawfulDebt acts d c →
    Deontic.RegulatedActOccurred Deontic.NormId.s1962c p c



theorem s1962c_elements_implies_deontic
    {p : Person} {e : Elements.Enterprise} {acts : List Elements.RacketeeringAct}
    {d : Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Elements.Section1962c p e acts d c) : Deontic.Prohibition1962cViolated p c :=
  ⟨⟨corr_d_addressee h.associated, corr_d_condition h.interstateCommerce⟩,
   corr_d_act h.conducts h.predicateBasis⟩

axiom corr_o_person {p : Person} {c : ComplaintText} :
    Elements.CulpablePersonCapableOfIntent p c → Ontology.IsPerson (mapPerson_EO p) c
axiom corr_o_enterprise {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.IsEnterprise e c → Ontology.IsEnterprise (mapEnt_EO e) c
axiom corr_do_person {p : Person} {c : ComplaintText} :
    Deontic.AddresseeInClass Deontic.NormId.s1962c p c → Ontology.IsPerson (mapPerson_EO p) c



def S1962TermsInhabited (p : Person) (e : Elements.Enterprise) (c : ComplaintText) : Prop :=
  Ontology.IsPerson (mapPerson_EO p) c ∧ Ontology.IsEnterprise (mapEnt_EO e) c


theorem s1962c_elements_implies_ontology
    {p : Person} {e : Elements.Enterprise} {acts : List Elements.RacketeeringAct}
    {d : Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Elements.Section1962c p e acts d c) : S1962TermsInhabited p e c :=
  ⟨corr_o_person h.culpable, corr_o_enterprise h.enterprise⟩



theorem s1962c_deontic_implies_ontology
    {p : Person} {c : ComplaintText}
    (h : Deontic.Prohibition1962cViolated p c) : Ontology.IsPerson (mapPerson_EO p) c :=
  corr_do_person h.1.addressee


def s1962_tierA_pairwise : Prop :=
  (∀ {p e acts d c}, Elements.Section1962c p e acts d c → Deontic.Prohibition1962cViolated p c)
  ∧ (∀ {p e acts d c}, Elements.Section1962c p e acts d c → S1962TermsInhabited p e c)
  ∧ (∀ {p c}, Deontic.Prohibition1962cViolated p c → Ontology.IsPerson (mapPerson_EO p) c)

theorem s1962_tierA : s1962_tierA_pairwise :=
  ⟨fun h => s1962c_elements_implies_deontic h,
   fun h => s1962c_elements_implies_ontology h,
   fun h => s1962c_deontic_implies_ontology h⟩







axiom corr_gc_culpable {p : Person} {c : ComplaintText} :
    Elements.CulpablePersonCapableOfIntent p c →
    Proving.Rico.CulpablePersonCapableOfIntent (mapPerson_ER p) (mapComplaint_ER c)
axiom corr_gc_enterprise {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.IsEnterprise e c → Proving.Rico.IsEnterprise (mapEnt_ER e) (mapComplaint_ER c)
axiom corr_gc_commerce {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.EngagedInInterstateCommerce e c →
    Proving.Rico.EngagedInInterstateCommerce (mapEnt_ER e) (mapComplaint_ER c)
axiom corr_gc_distinct {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.PersonEnterpriseDistinct p e c →
    Proving.Rico.PersonEnterpriseDistinct (mapPerson_ER p) (mapEnt_ER e) (mapComplaint_ER c)
axiom corr_gc_associated {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.EmployedOrAssociated p e c →
    Proving.Rico.EmployedOrAssociated (mapPerson_ER p) (mapEnt_ER e) (mapComplaint_ER c)
axiom corr_gc_conducts {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.ConductsOrParticipates p e c →
    Proving.Rico.ConductsOrParticipates (mapPerson_ER p) (mapEnt_ER e) (mapComplaint_ER c)
axiom corr_gc_pattern {acts : List Elements.RacketeeringAct} {d : Elements.UnlawfulDebt} {c : ComplaintText} :
    Elements.PatternOrUnlawfulDebt acts d c →
    Proving.Rico.PatternOfRacketeering (mapActs_ER acts) (mapComplaint_ER c)



theorem cand_c_implies_golden_c
    {p : Person} {e : Elements.Enterprise} {acts : List Elements.RacketeeringAct}
    {d : Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Elements.Section1962c p e acts d c) :
    Proving.Rico.Section1962c (mapPerson_ER p) (mapEnt_ER e) (mapActs_ER acts) (mapComplaint_ER c) :=
  ⟨corr_gc_culpable h.culpable, corr_gc_enterprise h.enterprise, corr_gc_commerce h.interstateCommerce,
   corr_gc_distinct h.distinct, corr_gc_associated h.associated, corr_gc_conducts h.conducts,
   corr_gc_pattern h.predicateBasis⟩


axiom corr_ga_pattern {p : Person} {i : Elements.Income} {c : ComplaintText} :
    Elements.ReceivedIncomeFromPatternOrDebt p i c →
    Proving.Rico.PatternOfRacketeering (mkActs_ER c) (mapComplaint_ER c)
axiom corr_ga_derived {p : Person} {i : Elements.Income} {c : ComplaintText} :
    Elements.ReceivedIncomeFromPatternOrDebt p i c →
    Proving.Rico.DerivedFromPattern (mkInvest_ER i) (mkActs_ER c) (mapComplaint_ER c)
axiom corr_ga_invested {p : Person} {i : Elements.Income} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.UsedOrInvestedIncomeInEnterprise p i e c →
    Proving.Rico.InvestedInEnterprise (mapPerson_ER p) (mkInvest_ER i) (mapEnt_ER e) (mapComplaint_ER c)



theorem cand_a_implies_golden_a
    {p : Person} {i : Elements.Income} {e : Elements.Enterprise} {c : ComplaintText}
    (h : Elements.Section1962a p i e c) :
    Proving.Rico.Section1962a (mapPerson_ER p) (mapEnt_ER e) (mkInvest_ER i) (mkActs_ER c) (mapComplaint_ER c) :=
  ⟨corr_gc_culpable h.culpable, corr_gc_enterprise h.enterprise, corr_gc_commerce h.interstateCommerce,
   corr_ga_pattern h.income, corr_ga_derived h.income, corr_ga_invested h.invested⟩


axiom corr_gb_acquired {p : Person} {e : Elements.Enterprise} {c : ComplaintText} :
    Elements.AcquiredOrMaintainedInterestOrControl p e c →
    Proving.Rico.AcquiredOrMaintainedControl (mapPerson_ER p) (mkIC_ER c) (mapEnt_ER e) (mapComplaint_ER c)
axiom corr_gb_through {acts : List Elements.RacketeeringAct} {d : Elements.UnlawfulDebt} {c : ComplaintText} :
    Elements.PatternOrUnlawfulDebt acts d c →
    Proving.Rico.AcquisitionThroughPattern (mkIC_ER c) (mapActs_ER acts) (mapComplaint_ER c)



theorem cand_b_implies_golden_b
    {p : Person} {e : Elements.Enterprise} {acts : List Elements.RacketeeringAct}
    {d : Elements.UnlawfulDebt} {c : ComplaintText}
    (h : Elements.Section1962b p e acts d c) :
    Proving.Rico.Section1962b (mapPerson_ER p) (mapEnt_ER e) (mkIC_ER c) (mapActs_ER acts) (mapComplaint_ER c) :=
  ⟨corr_gc_culpable h.culpable, corr_gc_enterprise h.enterprise, corr_gc_commerce h.interstateCommerce,
   corr_gc_pattern h.predicateBasis, corr_gb_acquired h.acquiredControl, corr_gb_through h.predicateBasis⟩


axiom corr_gd_agreed {p : Person} {c : ComplaintText} :
    Elements.AgreementAmongTwoOrMore p c → Elements.AgreedToViolateSubstantiveProvision p c →
    Proving.Rico.AgreementToViolateRico (mapPerson_ER p) (mkAgreement_ER c) (mapComplaint_ER c)
axiom corr_gd_knew {p : Person} {c : ComplaintText} :
    Elements.AgreedToViolateSubstantiveProvision p c →
    Proving.Rico.KnowledgeOfRicoObjective (mapPerson_ER p) (mkAgreement_ER c) (mapComplaint_ER c)
axiom corr_gd_underlying {p : Person} {c : ComplaintText} :
    Elements.AgreedToViolateSubstantiveProvision p c →
    Proving.Rico.UnderlyingSubstantiveViolationContemplated (mkAgreement_ER c) (mapComplaint_ER c)



theorem cand_d_implies_golden_d
    {p : Person} {c : ComplaintText}
    (h : Elements.Section1962d p c) :
    Proving.Rico.Section1962d (mapPerson_ER p) (mkAgreement_ER c) (mapComplaint_ER c) :=
  ⟨corr_gc_culpable h.culpable, corr_gd_agreed h.agreement h.agreedToViolate,
   corr_gd_knew h.agreedToViolate, corr_gd_underlying h.agreedToViolate⟩



def s1962_golden_basis : Prop :=
  (∀ {p i e c}, Elements.Section1962a p i e c →
      Proving.Rico.Section1962a (mapPerson_ER p) (mapEnt_ER e) (mkInvest_ER i) (mkActs_ER c) (mapComplaint_ER c))
  ∧ (∀ {p e acts d c}, Elements.Section1962b p e acts d c →
      Proving.Rico.Section1962b (mapPerson_ER p) (mapEnt_ER e) (mkIC_ER c) (mapActs_ER acts) (mapComplaint_ER c))
  ∧ (∀ {p e acts d c}, Elements.Section1962c p e acts d c →
      Proving.Rico.Section1962c (mapPerson_ER p) (mapEnt_ER e) (mapActs_ER acts) (mapComplaint_ER c))
  ∧ (∀ {p c}, Elements.Section1962d p c →
      Proving.Rico.Section1962d (mapPerson_ER p) (mkAgreement_ER c) (mapComplaint_ER c))

theorem s1962_golden : s1962_golden_basis :=
  ⟨fun h => cand_a_implies_golden_a h, fun h => cand_b_implies_golden_b h,
   fun h => cand_c_implies_golden_c h, fun h => cand_d_implies_golden_d h⟩






axiom corr_petition_within {asset : Procedure.Property} {c : ComplaintText} :
    Procedure.ThirdPartyPetitionWithinThirtyDays asset c → Elements.PetitionFiledWithinThirtyDays c
axiom corr_ground_superior {asset : Procedure.Property} {p : Person} {c : ComplaintText} :
    Procedure.SuperiorOrVestedInterestProven asset c →
    Elements.PetitionerHasVestedOrSuperiorInterest p (mapProp_PE asset) c
axiom corr_ground_bfp {asset : Procedure.Property} {p : Person} {c : ComplaintText} :
    Procedure.BonaFidePurchaserProven asset c →
    Elements.PetitionerIsBonaFidePurchaser p (mapProp_PE asset) c


theorem procedure_ground_implies_elements_interest
    {asset : Procedure.Property} {p : Person} {c : ComplaintText}
    (h : Procedure.ThirdPartyClaimGround asset c) :
    Elements.PetitionerInterest p (mapProp_PE asset) c :=
  match h with
  | .superiorInterest hs => .vestedSuperior (corr_ground_superior hs)
  | .bonaFidePurchaser hb => .bonaFide (corr_ground_bfp hb)




theorem s1963_procedure_implies_elements
    {asset : Procedure.Property} {p : Person} {c : ComplaintText}
    (h : Procedure.AncillaryForfeitureAdjudication asset p c) :
    Elements.ValidThirdPartyPetition p (mapProp_PE asset) c :=
  ⟨corr_petition_within h.hearing.petition.withinThirty,
   procedure_ground_implies_elements_interest h.ground⟩

axiom corr_o_forfeit_P {asset : Procedure.Property} {c : ComplaintText} :
    Procedure.ForfeitureJudgmentEntered asset c → Ontology.IsForfeitableProperty (mapProp_PO asset) c
axiom corr_o_forfeit_E {pr : Elements.Property} {c : ComplaintText} :
    Elements.ForfeitableProperty pr c → Ontology.IsForfeitableProperty (mapProp_EO pr) c



theorem s1963_procedure_implies_ontology
    {asset : Procedure.Property} {p : Person} {c : ComplaintText}
    (h : Procedure.AncillaryForfeitureAdjudication asset p c) :
    Ontology.IsForfeitableProperty (mapProp_PO asset) c :=
  corr_o_forfeit_P h.judgment


theorem s1963_elements_implies_ontology
    {p : Person} {e : Elements.Enterprise} {i : Elements.Income}
    {acts : List Elements.RacketeeringAct} {d : Elements.UnlawfulDebt}
    {pr : Elements.Property} {c : ComplaintText}
    (h : Elements.CriminalForfeiture p e i acts d pr c) :
    Ontology.IsForfeitableProperty (mapProp_EO pr) c :=
  corr_o_forfeit_E h.forfeitable


def s1963_tierA_pairwise : Prop :=
  (∀ {asset p c}, Procedure.AncillaryForfeitureAdjudication asset p c →
      Elements.ValidThirdPartyPetition p (mapProp_PE asset) c)
  ∧ (∀ {asset p c}, Procedure.AncillaryForfeitureAdjudication asset p c →
      Ontology.IsForfeitableProperty (mapProp_PO asset) c)
  ∧ (∀ {p e i acts d pr c}, Elements.CriminalForfeiture p e i acts d pr c →
      Ontology.IsForfeitableProperty (mapProp_EO pr) c)

theorem s1963_tierA : s1963_tierA_pairwise :=
  ⟨fun h => s1963_procedure_implies_elements h,
   fun h => s1963_procedure_implies_ontology h,
   fun h => s1963_elements_implies_ontology h⟩






axiom corr_reason_PE {p : Person} {c : ComplaintText} :
    Procedure.ReasonToBelieveMaterialRelevant c → Elements.AttorneyGeneralReasonToBelievePossession p c
axiom corr_nature_PE {d : Procedure.CivilInvestigativeDemand} {c : ComplaintText} :
    Procedure.DemandStatesNatureOfConduct d c → Elements.DemandStatesNatureOfConduct (mapDem_PE d) c
axiom corr_desc_PE {d : Procedure.CivilInvestigativeDemand} {c : ComplaintText} :
    Procedure.DemandDescribesMaterial d c → Elements.DemandDescribesMaterial (mapDem_PE d) c
axiom corr_ret_PE {d : Procedure.CivilInvestigativeDemand} {c : ComplaintText} :
    Procedure.DemandStatesReturnDate d c → Elements.DemandStatesReturnDate (mapDem_PE d) c
axiom corr_cust_PE {d : Procedure.CivilInvestigativeDemand} {c : ComplaintText} :
    Procedure.DemandIdentifiesCustodian d c → Elements.DemandIdentifiesCustodian (mapDem_PE d) c




theorem s1968_procedure_implies_elements
    {p : Person} {d : Procedure.CivilInvestigativeDemand} {c : ComplaintText}
    (h : Procedure.ValidDemandIssuanceAndService d c) :
    Elements.ValidCivilInvestigativeDemand p (mapDem_PE d) c :=
  ⟨corr_reason_PE h.reasonToBelieve, corr_nature_PE h.wellFormed.statesConduct,
   corr_desc_PE h.wellFormed.describesMat, corr_ret_PE h.wellFormed.statesReturn,
   corr_cust_PE h.wellFormed.identifiesCust⟩

axiom corr_o_cust_P {c : ComplaintText} :
    Procedure.CustodianDesignated c → Ontology.IsRacketeerDocumentCustodian (mkCust_O c) c
axiom corr_o_cust_E {dem : Elements.Demand} {c : ComplaintText} :
    Elements.DemandIdentifiesCustodian dem c → Ontology.IsRacketeerDocumentCustodian (mkCust_O c) c


theorem s1968_procedure_implies_ontology
    {d : Procedure.CivilInvestigativeDemand} {c : ComplaintText}
    (h : Procedure.ValidDemandIssuanceAndService d c) :
    Ontology.IsRacketeerDocumentCustodian (mkCust_O c) c :=
  corr_o_cust_P h.custodian


theorem s1968_elements_implies_ontology
    {p : Person} {dem : Elements.Demand} {c : ComplaintText}
    (h : Elements.ValidCivilInvestigativeDemand p dem c) :
    Ontology.IsRacketeerDocumentCustodian (mkCust_O c) c :=
  corr_o_cust_E h.identifiesCustodian


def s1968_tierA_pairwise : Prop :=
  (∀ {p d c}, Procedure.ValidDemandIssuanceAndService d c →
      Elements.ValidCivilInvestigativeDemand p (mapDem_PE d) c)
  ∧ (∀ {d c}, Procedure.ValidDemandIssuanceAndService d c →
      Ontology.IsRacketeerDocumentCustodian (mkCust_O c) c)
  ∧ (∀ {p dem c}, Elements.ValidCivilInvestigativeDemand p dem c →
      Ontology.IsRacketeerDocumentCustodian (mkCust_O c) c)

theorem s1968_tierA : s1968_tierA_pairwise :=
  ⟨fun h => s1968_procedure_implies_elements h,
   fun h => s1968_procedure_implies_ontology h,
   fun h => s1968_elements_implies_ontology h⟩







axiom corr_lim_PE {p : Person} {c : ComplaintText} :
    Procedure.CivilActionFiledWithinFourYears p c → Elements.WithinLimitations p c
axiom corr_bar_PE {p : Person} {c : ComplaintText} :
    (¬ Procedure.SecuritiesFraudExceptionBars p c) → Elements.SecuritiesFraudBarOvercome p c


def S1964Core (p : Person) (c : ComplaintText) : Prop :=
  Elements.WithinLimitations p c ∧ Elements.SecuritiesFraudBarOvercome p c


theorem s1964_procedure_implies_elements
    {p : Person} {c : ComplaintText}
    (h : Procedure.TimelyCivilRicoAction p c) : S1964Core p c :=
  ⟨corr_lim_PE h.withinFourYears, corr_bar_PE h.notBarred⟩



axiom corr_venue_resides {p : Person} {c : ComplaintText} :
    Elements.DefendantResidesInDistrict p c → Procedure.HasVenueNexus p c
axiom corr_venue_found {p : Person} {c : ComplaintText} :
    Elements.DefendantFoundInDistrict p c → Procedure.HasVenueNexus p c
axiom corr_venue_agent {p : Person} {c : ComplaintText} :
    Elements.DefendantHasAgentInDistrict p c → Procedure.HasVenueNexus p c
axiom corr_venue_transacts {p : Person} {c : ComplaintText} :
    Elements.DefendantTransactsAffairsInDistrict p c → Procedure.HasVenueNexus p c



theorem s1965_elements_implies_procedure
    {p : Person} {c : ComplaintText}
    (h : Elements.ProperVenue p c) : Procedure.HasVenueNexus p c :=
  match h with
  | .resides hr => corr_venue_resides hr
  | .found hf => corr_venue_found hf
  | .hasAgent ha => corr_venue_agent ha
  | .transacts ht => corr_venue_transacts ht



axiom corr_cert_PE {c : ComplaintText} :
    Procedure.PublicImportanceCertificateFiled c → Elements.AttorneyGeneralCertifiesPublicImportance c


theorem s1966_procedure_implies_elements
    {c : ComplaintText}
    (h : Procedure.ExpeditionSequence c) : Elements.AttorneyGeneralCertifiesPublicImportance c :=
  corr_cert_PE h.certificateFiled



axiom corr_1967_addr {p : Person} {c : ComplaintText} :
    Procedure.AffectedPersonsRightsConsidered c → Deontic.AddresseeInClass Deontic.NormId.s1967CourtDiscretion p c
axiom corr_1967_cond {c : ComplaintText} :
    Procedure.ProceedingClosedAtCourtDiscretion c → Deontic.ConditionMet Deontic.NormId.s1967CourtDiscretion c



theorem s1967_procedure_implies_deontic
    {p : Person} {c : ComplaintText}
    (h : Procedure.DiscretionaryClosure c) :
    Deontic.PowerExercisable Deontic.NormId.s1967CourtDiscretion p c :=
  ⟨corr_1967_addr h.rightsConsidered, corr_1967_cond h.closed⟩

end Proving.USC.T18.Ch96.Bridge
