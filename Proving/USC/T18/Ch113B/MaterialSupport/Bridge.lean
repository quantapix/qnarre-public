
















































import Proving.USC.Common.Types
import Proving.USC.T18.Ch113B.MaterialSupport.Elements.Theorems
import Proving.USC.T18.Ch113B.MaterialSupport.Deontic.Theorems
import Proving.USC.T18.Ch113B.MaterialSupport.Ontology.Theorems
import Proving.USC.T18.Ch113B.MaterialSupport.Procedure.Theorems

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.MaterialSupport.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch113B.MaterialSupport








axiom mapOffenseED  : Elements.PredicateOffense → Deontic.Offense
axiom mapSupportED  : Elements.Support          → Deontic.MaterialSupport
axiom mapOrgED      : Elements.Organization     → Deontic.Organization
axiom mapFundsED    : Elements.Funds            → Deontic.Funds
axiom mapTrainingED : Elements.Training         → Deontic.MilitaryTraining
axiom mapEntityED   : Elements.LegalEntity      → Deontic.LegalEntity
axiom mapPredActED  : Elements.PredicateAct     → Deontic.Offense



axiom mapFiED       : Person                    → Deontic.FinancialInstitution

axiom mapOffenseEO  : Elements.PredicateOffense → Ontology.PredicateAct
axiom mapSupportEO  : Elements.Support          → Ontology.SupportItem
axiom mapOrgEO      : Elements.Organization     → Ontology.Organization
axiom mapFundsEO    : Elements.Funds            → Ontology.FundsItem
axiom mapPredActEO  : Elements.PredicateAct     → Ontology.PredicateAct
axiom mapTrainingEO : Elements.Training         → Ontology.SupportItem

axiom mapOffenseDO  : Deontic.Offense           → Ontology.PredicateAct
axiom mapSupportDO  : Deontic.MaterialSupport   → Ontology.SupportItem
axiom mapOrgDO      : Deontic.Organization      → Ontology.Organization
axiom mapTrainingDO : Deontic.MilitaryTraining  → Ontology.SupportItem

axiom mapFundsEP    : Elements.Funds            → Procedure.Funds
axiom mapEntityEP   : Elements.LegalEntity      → Procedure.LegalEntity
axiom mapOrgEP      : Elements.Organization     → Procedure.Organization
axiom mapFiEP       : Person                    → Procedure.FinancialInstitution




axiom conductHarbor  : Person → Person → Ontology.Conduct

axiom conductFunding : Person → Elements.Funds → Ontology.Conduct










axiom corr2339_addressee {d t : Person} {c : ComplaintText} :
    Elements.HarborsOrConceals d t c → Deontic.AddresseeInClass2339 d c
axiom corr2339_enumerated {o : Elements.PredicateOffense} {c : ComplaintText} :
    Elements.IsEnumeratedOffenseUnder2339 o c →
    Deontic.IsEnumeratedOffense2339 (mapOffenseED o) c


axiom corr2339_condition {d t : Person} {o : Elements.PredicateOffense}
    {c : ComplaintText} :
    Elements.CommittedOrAboutToCommitOffense t o c → Elements.Scienter2339 d t c →
    Deontic.ConditionMet2339 d t (mapOffenseED o) c
axiom corr2339_act {d t : Person} {c : ComplaintText} :
    Elements.HarborsOrConceals d t c → Deontic.RegulatedActOccurred2339 d t c


theorem s2339_elements_implies_deontic
    {d t : Person} {o : Elements.PredicateOffense} {c : ComplaintText}
    (h : Elements.Section2339a d t o c) :
    Deontic.Prohibition2339Violated d t (mapOffenseED o) c :=
  ⟨⟨corr2339_addressee h.harbors,
    corr2339_enumerated h.enumeratedOffense,
    corr2339_condition h.offenderStatus h.scienter⟩,
   corr2339_act h.harbors⟩

axiom corr2339_ontOffense {o : Elements.PredicateOffense} {c : ComplaintText} :
    Elements.IsEnumeratedOffenseUnder2339 o c →
    Ontology.IsEnumeratedTerrorismOffenseUnder2339 (mapOffenseEO o) c
axiom corr2339_ontConduct {d t : Person} {c : ComplaintText} :
    Elements.HarborsOrConceals d t c →
    Ontology.IsHarborOrConcealConduct (conductHarbor d t) c




theorem s2339_elements_implies_ontology
    {d t : Person} {o : Elements.PredicateOffense} {c : ComplaintText}
    (h : Elements.Section2339a d t o c) :
    Ontology.Section2339TermUse (mapOffenseEO o) (conductHarbor d t) c :=
  ⟨corr2339_ontOffense h.enumeratedOffense, corr2339_ontConduct h.harbors⟩

axiom corr2339_deonOntOffense {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.IsEnumeratedOffense2339 o c →
    Ontology.IsEnumeratedTerrorismOffenseUnder2339 (mapOffenseDO o) c
axiom corr2339_deonOntConduct {d t : Person} {c : ComplaintText} :
    Deontic.RegulatedActOccurred2339 d t c →
    Ontology.IsHarborOrConcealConduct (conductHarbor d t) c


theorem s2339_deontic_implies_ontology
    {d t : Person} {o : Deontic.Offense} {c : ComplaintText}
    (h : Deontic.Prohibition2339Violated d t o c) :
    Ontology.Section2339TermUse (mapOffenseDO o) (conductHarbor d t) c :=
  ⟨corr2339_deonOntOffense h.1.enumerated, corr2339_deonOntConduct h.2⟩






axiom corr2339A_addressee {d : Person} {s : Elements.Support} {c : ComplaintText} :
    Elements.Conduct2339A d s c → Deontic.AddresseeInClass2339A d c


axiom corr2339A_object {s : Elements.Support} {c : ComplaintText} :
    Elements.IsMaterialSupportOrResources s c →
    Deontic.IsMaterialSupportOrResources2339A (mapSupportED s) c
axiom corr2339A_enumerated {o : Elements.PredicateOffense} {c : ComplaintText} :
    Elements.IsEnumeratedPredicateOffenseUnder2339A o c →
    Deontic.IsEnumeratedOffense2339A (mapOffenseED o) c
axiom corr2339A_condition {d : Person} {s : Elements.Support}
    {o : Elements.PredicateOffense} {c : ComplaintText} :
    Elements.Purpose2339A d s o c →
    Deontic.ConditionMet2339A d (mapSupportED s) (mapOffenseED o) c
axiom corr2339A_act {d : Person} {s : Elements.Support} {c : ComplaintText} :
    Elements.Conduct2339A d s c → Deontic.RegulatedActOccurred2339A d (mapSupportED s) c


theorem s2339A_elements_implies_deontic
    {d : Person} {s : Elements.Support} {o : Elements.PredicateOffense}
    {c : ComplaintText} (h : Elements.Section2339Aa d s o c) :
    Deontic.Prohibition2339AViolated d (mapSupportED s) (mapOffenseED o) c :=
  ⟨⟨corr2339A_addressee h.conduct,
    Deontic.MaterialSupportRoute2339A.general (corr2339A_object h.materialSupport),
    corr2339A_enumerated h.enumeratedOffense,
    corr2339A_condition h.purpose⟩,
   corr2339A_act h.conduct⟩










axiom corrMS_property {s : Elements.Support} {c : ComplaintText} :
    Elements.IsPropertyTangibleOrIntangible s c → Ontology.IsProperty (mapSupportEO s) c
axiom corrMS_service {s : Elements.Support} {c : ComplaintText} :
    Elements.IsServiceOrListedResource s c → Ontology.IsService (mapSupportEO s) c


axiom corrMS_training {s : Elements.Support} {c : ComplaintText} :
    Elements.IsTrainingSpecificSkill s c → Ontology.IsService (mapSupportEO s) c
axiom corrMS_expert {s : Elements.Support} {c : ComplaintText} :
    Elements.IsExpertAdviceOrAssistance s c → Ontology.IsService (mapSupportEO s) c
axiom corrMS_personnel {s : Elements.Support} {c : ComplaintText} :
    Elements.IsPersonnelProvided s c → Ontology.IsService (mapSupportEO s) c
axiom corrMS_medicine {s : Elements.Support} {c : ComplaintText} :
    Ontology.IsMedicine (mapSupportEO s) c → Elements.IsMedicineOrReligiousMaterials s c
axiom corrMS_religious {s : Elements.Support} {c : ComplaintText} :
    Ontology.IsReligiousMaterials (mapSupportEO s) c →
    Elements.IsMedicineOrReligiousMaterials s c
axiom corrMS_denotes {s : Elements.Support} {c : ComplaintText} :
    Elements.MaterialSupportOrResources s c →
    Ontology.IsMaterialSupportOrResources (mapSupportEO s) c



theorem materialSupportGenus_elements_implies_ontology
    {s : Elements.Support} {c : ComplaintText}
    (h : Elements.MaterialSupportCategory s c) :
    Ontology.MaterialSupportGenus (mapSupportEO s) c :=
  match h with
  | .property h     => .property (corrMS_property h)
  | .service h      => .service (corrMS_service h)
  | .training h     => .service (corrMS_training h)
  | .expertAdvice h => .service (corrMS_expert h)
  | .personnel h    => .service (corrMS_personnel h)


theorem materialSupport_elements_implies_ontology
    {s : Elements.Support} {c : ComplaintText}
    (h : Elements.MaterialSupportOrResources s c) :
    Ontology.MaterialSupportMembership (mapSupportEO s) c :=
  ⟨materialSupportGenus_elements_implies_ontology h.category,
   fun hm => h.notExcepted (corrMS_medicine hm),
   fun hr => h.notExcepted (corrMS_religious hr),
   corrMS_denotes h⟩

axiom corr2339A_ontOffense {o : Elements.PredicateOffense} {c : ComplaintText} :
    Elements.IsEnumeratedPredicateOffenseUnder2339A o c →
    Ontology.IsEnumeratedOffenseUnder2339A (mapOffenseEO o) c


theorem s2339A_elements_implies_ontology
    {d : Person} {s : Elements.Support} {o : Elements.PredicateOffense}
    {c : ComplaintText} (h : Elements.Section2339Aa d s o c) :
    Ontology.Section2339ATermUse (mapSupportEO s) (mapOffenseEO o) c :=
  ⟨corrMS_denotes h.materialSupport, corr2339A_ontOffense h.enumeratedOffense⟩

axiom corr2339A_deonOntGeneral {m : Deontic.MaterialSupport} {c : ComplaintText} :
    Deontic.IsMaterialSupportOrResources2339A m c →
    Ontology.IsMaterialSupportOrResources (mapSupportDO m) c
axiom corr2339A_deonOntTraining {m : Deontic.MaterialSupport} {c : ComplaintText} :
    Deontic.IsTraining2339A m c →
    Ontology.IsMaterialSupportOrResources (mapSupportDO m) c
axiom corr2339A_deonOntExpert {m : Deontic.MaterialSupport} {c : ComplaintText} :
    Deontic.IsExpertAdviceOrAssistance2339A m c →
    Ontology.IsMaterialSupportOrResources (mapSupportDO m) c
axiom corr2339A_deonOntOffense {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.IsEnumeratedOffense2339A o c →
    Ontology.IsEnumeratedOffenseUnder2339A (mapOffenseDO o) c


theorem materialSupportRoute_deontic_implies_ontology
    {m : Deontic.MaterialSupport} {c : ComplaintText}
    (h : Deontic.MaterialSupportRoute2339A m c) :
    Ontology.IsMaterialSupportOrResources (mapSupportDO m) c :=
  match h with
  | .general h      => corr2339A_deonOntGeneral h
  | .training h     => corr2339A_deonOntTraining h
  | .expertAdvice h => corr2339A_deonOntExpert h


theorem s2339A_deontic_implies_ontology
    {d : Person} {m : Deontic.MaterialSupport} {o : Deontic.Offense}
    {c : ComplaintText} (h : Deontic.Prohibition2339AViolated d m o c) :
    Ontology.Section2339ATermUse (mapSupportDO m) (mapOffenseDO o) c :=
  ⟨materialSupportRoute_deontic_implies_ontology h.1.object,
   corr2339A_deonOntOffense h.1.enumerated⟩







axiom corrJur_national {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.OffenderIsUSNationalOrLawfulPermanentResident d c →
    Deontic.IsNationalOrLawfulPermanentResident d c
axiom corrJur_stateless {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.OffenderIsStatelessHabitualResidentOfUS d c →
    Deontic.IsStatelessPersonHabituallyResidentInUS d c
axiom corrJur_brought {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.OffenderBroughtIntoOrFoundInUS d c →
    Deontic.BroughtIntoOrFoundInTheUnitedStates d c
axiom corrJur_occurs {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.OffenseOccursInWholeOrPartInUS d c →
    Deontic.OffenseOccursInWholeOrPartInTheUnitedStates po c
axiom corrJur_commerce {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.OffenseAffectsInterstateOrForeignCommerce d c →
    Deontic.OffenseAffectsInterstateOrForeignCommerce po c
axiom corrJur_aids {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.AidsAbetsOrConspiresWithPersonSubjectToJurisdiction d c →
    Deontic.AidsAbetsOrConspiresWithJurisdictionalOffender d po c



theorem jurisdictionNexus_elements_implies_deontic
    {d : Person} {c : ComplaintText} (po : Deontic.Offense)
    (h : Elements.JurisdictionOverOffense d c) :
    Deontic.JurisdictionalNexusCh113B d po c :=
  match h with
  | .usNationalOrLPR h      => Or.inl (corrJur_national po h)
  | .statelessResident h    => Or.inr (Or.inl (corrJur_stateless po h))
  | .broughtOrFoundInUS h   => Or.inr (Or.inr (Or.inl (corrJur_brought po h)))
  | .occursInUS h           => Or.inr (Or.inr (Or.inr (Or.inl (corrJur_occurs po h))))
  | .affectsCommerce h      =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corrJur_commerce po h)))))
  | .aidsAbetsOrConspires h =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (corrJur_aids po h)))))

axiom corrJurP_national {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.OffenderIsUSNationalOrLawfulPermanentResident d c →
    Procedure.OffenderIsUnitedStatesNationalOrLawfulPermanentResident d c
axiom corrJurP_stateless {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.OffenderIsStatelessHabitualResidentOfUS d c →
    Procedure.OffenderIsStatelessPersonHabituallyResidentInUnitedStates d c
axiom corrJurP_brought {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.OffenderBroughtIntoOrFoundInUS d c →
    Procedure.OffenderBroughtIntoOrFoundInUnitedStates d po c
axiom corrJurP_occurs {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.OffenseOccursInWholeOrPartInUS d c →
    Procedure.OffenseOccursInWholeOrPartWithinUnitedStates po c
axiom corrJurP_commerce {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.OffenseAffectsInterstateOrForeignCommerce d c →
    Procedure.OffenseOccursInOrAffectsInterstateOrForeignCommerce po c
axiom corrJurP_aids {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.AidsAbetsOrConspiresWithPersonSubjectToJurisdiction d c →
    Procedure.OffenderAidsAbetsOrConspiresWithPersonSubjectToJurisdiction d po c


theorem jurisdictionNexus_elements_implies_procedure
    {d : Person} {c : ComplaintText} (po : Procedure.Offense)
    (h : Elements.JurisdictionOverOffense d c) :
    Procedure.Section2339BJurisdictionEstablished d po c :=
  match h with
  | .usNationalOrLPR h      => Or.inl (corrJurP_national po h)
  | .statelessResident h    => Or.inr (Or.inl (corrJurP_stateless po h))
  | .broughtOrFoundInUS h   => Or.inr (Or.inr (Or.inl (corrJurP_brought po h)))
  | .occursInUS h           => Or.inr (Or.inr (Or.inr (Or.inl (corrJurP_occurs po h))))
  | .affectsCommerce h      =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inl (corrJurP_commerce po h)))))
  | .aidsAbetsOrConspires h =>
      Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (corrJurP_aids po h)))))
















axiom corr2339B_addressee {d : Person} {s : Elements.Support}
    {o : Elements.Organization} {c : ComplaintText} :
    Elements.ProvidesMaterialSupportToOrganization d s o c →
    Deontic.AddresseeInClass2339Ba1 d c
axiom corr2339B_org {o : Elements.Organization} {c : ComplaintText} :
    Elements.IsDesignatedForeignTerroristOrganization o c →
    Deontic.IsForeignTerroristOrganization2339B (mapOrgED o) c
axiom corr2339B_scienter {d : Person} {o : Elements.Organization} {c : ComplaintText} :
    ActedWithScienter d c → Elements.KnowledgeOfTerroristOrganization d o c →
    Deontic.ConditionMet2339Ba1 d (mapOrgED o) c
axiom corr2339B_act {d : Person} {s : Elements.Support} {o : Elements.Organization}
    {c : ComplaintText} :
    Elements.ProvidesMaterialSupportToOrganization d s o c →
    Deontic.RegulatedActOccurred2339Ba1 d (mapSupportED s) (mapOrgED o) c


axiom corr2339B_approval {d : Person} {s : Elements.Support}
    {o : Elements.Organization} {c : ComplaintText} :
    Deontic.SecretaryOfStateApprovedWithAttorneyGeneralConcurrence2339Bj d
      (mapSupportED s) c →
    Elements.SecretaryApprovedProvisionOfSupport d o c


axiom corr2339B_control {d : Person} {o : Elements.Organization} {c : ComplaintText} :
    Elements.ProvidedPersonnelUnderDirectionOrControl d o c →
    Deontic.ProvidedPersonnelUnderOrganizationDirectionOrControl2339Bh d (mapOrgED o) c








theorem s2339Ba1_elements_implies_deontic_modulo_gaps
    {d : Person} {s : Elements.Support} {o : Elements.Organization}
    {c : ComplaintText} (po : Deontic.Offense)
    (gap_2339Bh_personnel_bar :
      ¬ Deontic.PersonnelProsecutionBar2339Bh d (mapOrgED o) c)
    (h : Elements.Section2339Ba1 d s o c) :
    Deontic.Prohibition2339Ba1Violated d (mapSupportED s) (mapOrgED o) po c :=
  ⟨⟨corr2339B_addressee h.provides,
    corr2339B_org h.designated,
    Deontic.MaterialSupportRoute2339A.general (corr2339A_object h.materialSupport),
    corr2339B_scienter h.knowingly h.organizationKnowledge,
    jurisdictionNexus_elements_implies_deontic po h.jurisdiction⟩,
   corr2339B_act h.provides,
   fun hbar => hbar.elim gap_2339Bh_personnel_bar
     (fun hj => h.notApproved (corr2339B_approval hj.2))⟩




theorem s2339Ba1personnel_elements_implies_deontic
    {d : Person} {s : Elements.Support} {o : Elements.Organization}
    {c : ComplaintText} (po : Deontic.Offense)
    (h : Elements.Section2339Ba1Personnel d s o c) :
    Deontic.Prohibition2339Ba1Violated d (mapSupportED s) (mapOrgED o) po c :=
  ⟨⟨corr2339B_addressee h.offense.provides,
    corr2339B_org h.offense.designated,
    Deontic.MaterialSupportRoute2339A.general
      (corr2339A_object h.offense.materialSupport),
    corr2339B_scienter h.offense.knowingly h.offense.organizationKnowledge,
    jurisdictionNexus_elements_implies_deontic po h.offense.jurisdiction⟩,
   corr2339B_act h.offense.provides,
   fun hbar => hbar.elim
     (fun hh => hh.2 (corr2339B_control h.directionOrControl))
     (fun hj => h.offense.notApproved (corr2339B_approval hj.2))⟩

axiom corr2339B_ontOrg {o : Elements.Organization} {c : ComplaintText} :
    Elements.IsDesignatedForeignTerroristOrganization o c →
    Ontology.IsTerroristOrganization (mapOrgEO o) c


theorem s2339B_elements_implies_ontology
    {d : Person} {s : Elements.Support} {o : Elements.Organization}
    {c : ComplaintText} (h : Elements.Section2339Ba1 d s o c) :
    Ontology.Section2339BTermUse (mapSupportEO s) (mapOrgEO o) c :=
  ⟨corrMS_denotes h.materialSupport, corr2339B_ontOrg h.designated⟩

axiom corr2339B_deonOntOrg {g : Deontic.Organization} {c : ComplaintText} :
    Deontic.IsForeignTerroristOrganization2339B g c →
    Ontology.IsTerroristOrganization (mapOrgDO g) c


theorem s2339B_deontic_implies_ontology
    {d : Person} {m : Deontic.MaterialSupport} {g : Deontic.Organization}
    {o : Deontic.Offense} {c : ComplaintText}
    (h : Deontic.Prohibition2339Ba1Violated d m g o c) :
    Ontology.Section2339BTermUse (mapSupportDO m) (mapOrgDO g) c :=
  ⟨materialSupportRoute_deontic_implies_ontology h.1.object,
   corr2339B_deonOntOrg h.1.organization⟩


theorem s2339B_elements_implies_procedure
    {d : Person} {s : Elements.Support} {o : Elements.Organization}
    {c : ComplaintText} (po : Procedure.Offense)
    (h : Elements.Section2339Ba1 d s o c) :
    Procedure.Section2339BJurisdictionEstablished d po c :=
  jurisdictionNexus_elements_implies_procedure po h.jurisdiction








axiom corr2339Bb_addressee {fi : Person} {c : ComplaintText} :
    Elements.IsFinancialInstitution fi c →
    Deontic.AddresseeInClass2339Ba2 (mapFiED fi) c
axiom corr2339Bb_org {o : Elements.Organization} {c : ComplaintText} :
    Elements.IsDesignatedForeignTerroristOrganization o c →
    Deontic.IsForeignTerroristOrganization2339B (mapOrgED o) c
axiom corr2339Bb_funds {fi : Person} {f : Elements.Funds}
    {o : Elements.Organization} {c : ComplaintText} :
    Elements.AwareOfPossessionOrControlOfOrganizationFunds fi f o c →
    Deontic.IsFunds2339B (mapFundsED f) c
axiom corr2339Bb_condition {fi : Person} {f : Elements.Funds}
    {o : Elements.Organization} {c : ComplaintText} :
    Elements.AwareOfPossessionOrControlOfOrganizationFunds fi f o c →
    Deontic.ConditionMet2339Ba2 (mapFiED fi) (mapFundsED f) (mapOrgED o) c
axiom corr2339Bb_escape {fi : Person} {f : Elements.Funds} {c : ComplaintText} :
    Deontic.SecretaryAuthorizationApplies2339Ba2 (mapFiED fi) (mapFundsED f) c →
    Elements.AuthorizedBySecretary fi f c
axiom corr2339Bb_notRetained {fi : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.KnowinglyFailsToRetainFunds fi f c →
    Deontic.RetainedPossessionOrControl2339Ba2A (mapFiED fi) (mapFundsED f) c → False
axiom corr2339Bb_notReported {fi : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.KnowinglyFailsToReportFundsToSecretary fi f c →
    Deontic.ReportedToSecretary2339Ba2B (mapFiED fi) (mapFundsED f) c → False
axiom corr2339Bb_knowing {fi : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.FailureToComply2339Ba2 fi f c →
    Deontic.KnowinglyFailedToComply2339Bb (mapFiED fi) (mapFundsED f) c


theorem notPerformed_elements_implies_deontic
    {fi : Person} {f : Elements.Funds} {c : ComplaintText}
    (h : Elements.FailureToComply2339Ba2 fi f c) :
    ¬ Deontic.Obligation2339Ba2Performed (mapFiED fi) (mapFundsED f) c :=
  match h with
  | .failsToRetain h => fun hp => corr2339Bb_notRetained h hp.1
  | .failsToReport h => fun hp => corr2339Bb_notReported h hp.2


theorem s2339Bb_elements_implies_deontic
    {fi : Person} {f : Elements.Funds} {o : Elements.Organization}
    {c : ComplaintText} (h : Elements.Section2339Bb fi f o c) :
    Deontic.CivilPenaltyLiability2339Bb (mapFiED fi) (mapFundsED f) (mapOrgED o) c :=
  ⟨⟨⟨corr2339Bb_addressee h.financialInstitution,
     corr2339Bb_org h.designated,
     corr2339Bb_funds h.awareness,
     corr2339Bb_condition h.awareness⟩,
    fun he => h.notAuthorized (corr2339Bb_escape he),
    notPerformed_elements_implies_deontic h.failure⟩,
   corr2339Bb_knowing h.failure⟩

axiom corr2339Bb_pAware {fi : Person} {f : Elements.Funds}
    {o : Elements.Organization} {c : ComplaintText} :
    Elements.AwareOfPossessionOrControlOfOrganizationFunds fi f o c →
    Procedure.FinancialInstitutionAwareOfPossessionOrControlOfFunds
      (mapFiEP fi) (mapFundsEP f) c
axiom corr2339Bb_pInterest {fi : Person} {f : Elements.Funds}
    {o : Elements.Organization} {c : ComplaintText} :
    Elements.IsDesignatedForeignTerroristOrganization o c →
    Elements.AwareOfPossessionOrControlOfOrganizationFunds fi f o c →
    Procedure.ForeignTerroristOrganizationOrAgentHasInterestInFunds (mapFundsEP f) c
axiom corr2339Bb_pEscape {fi : Person} {f : Elements.Funds} {c : ComplaintText} :
    Procedure.SecretaryAuthorizedException (mapFiEP fi) (mapFundsEP f) c →
    Elements.AuthorizedBySecretary fi f c
axiom corr2339Bb_pKnowing {fi : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.FailureToComply2339Ba2 fi f c →
    Procedure.FinancialInstitutionKnowinglyFailedToComply (mapFiEP fi) (mapFundsEP f) c


theorem s2339Bb_elements_implies_procedure
    {fi : Person} {f : Elements.Funds} {o : Elements.Organization}
    {c : ComplaintText} (h : Elements.Section2339Bb fi f o c) :
    Procedure.Section2339BCivilPenaltyTrigger (mapFiEP fi) (mapFundsEP f) c :=
  ⟨corr2339Bb_pAware h.awareness,
   corr2339Bb_pInterest h.designated h.awareness,
   fun he => h.notAuthorized (corr2339Bb_pEscape he),
   corr2339Bb_pKnowing h.failure⟩







axiom corr2339Bc_deonToElem {s d : Person} {c : ComplaintText} :
    Deontic.AppearsEngagedOrAboutToEngageInViolation2339Bc s d c →
    Elements.EngagedOrAboutToEngageInViolation d c
axiom corr2339Bc_procToElem {d : Person} {pr : Procedure.Proceeding}
    {c : ComplaintText} :
    Procedure.AppearsToSecretaryOrAttorneyGeneralThatViolationIsOccurringOrImminent d c →
    Elements.EngagedOrAboutToEngageInViolation d c


theorem s2339Bc_deontic_implies_elements
    {a s d : Person} {c : ComplaintText}
    (h : Deontic.Power2339BcExercised a s d c) :
    Elements.Section2339Bc d c :=
  ⟨corr2339Bc_deonToElem h.1.condition⟩


theorem s2339Bc_procedure_implies_elements
    {d : Person} {pr : Procedure.Proceeding} {c : ComplaintText}
    (h : Procedure.Section2339BInjunctiveActionProper d pr c) :
    Elements.Section2339Bc d c :=
  ⟨corr2339Bc_procToElem (pr := pr) h.appearance⟩





axiom corr2339C_addressee {d : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.ProvidesOrCollectsFunds d f c → Deontic.AddresseeInClass2339Ca1 d c
axiom corr2339C_treaty {pa : Elements.PredicateAct} {c : ComplaintText} :
    Elements.IsTreatyOffenseUnderSection2339Ce7 pa c →
    Deontic.IsTreatyOffense2339Ca1A (mapPredActED pa) c



axiom corr2339C_clauseB {pa : Elements.PredicateAct} {c : ComplaintText} :
    Elements.PredicateActClauseB pa c →
    Deontic.IsIntimidationOrCompulsionAct2339Ca1B (mapPredActED pa) c
axiom corr2339C_condition {d : Person} {f : Elements.Funds}
    {pa : Elements.PredicateAct} {c : ComplaintText} :
    Elements.ActsUnlawfullyAndWillfully d c →
    Elements.IntendsOrKnowsFundsUsedForPredicateAct d f pa c →
    Deontic.ConditionMet2339Ca1 d (mapFundsED f) (mapPredActED pa) c
axiom corr2339C_act {d : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.ProvidesOrCollectsFunds d f c →
    Deontic.RegulatedActOccurred2339Ca1 d (mapFundsED f) c

axiom corr2339Cb_inUS {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.OffenseInUSWithForeignOrPredicateNexus d c →
    Deontic.OffenseTakesPlaceInTheUnitedStates2339Cb po c ∧
      Deontic.ForeignNexusCircumstance2339Cb1 d po c
axiom corr2339Cb_outUS {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.OffenseOutsideUSWithUnitedStatesNexus d c →
    (¬ Deontic.OffenseTakesPlaceInTheUnitedStates2339Cb po c) ∧
      Deontic.ExtraterritorialNexusCircumstance2339Cb2 d po c
axiom corr2339Cb_vessel {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.CommittedOnVesselOrAircraftOfUnitedStates d c →
    Deontic.CommittedOnUnitedStatesVesselOrAircraft2339Cb po c


axiom corr2339Cb_operated {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.CommittedOnAircraftOperatedByUnitedStates d c →
    Deontic.CommittedOnUnitedStatesVesselOrAircraft2339Cb po c
axiom corr2339Cb_compel {d : Person} {c : ComplaintText} (po : Deontic.Offense) :
    Elements.DirectedAtCompellingUnitedStates d c →
    Deontic.DirectedAtCompellingTheUnitedStates2339Cb5 po c



theorem jurisdiction2339C_elements_implies_deontic
    {d : Person} {c : ComplaintText} (po : Deontic.Offense)
    (h : Elements.JurisdictionUnder2339Cb d c) :
    Deontic.JurisdictionExists2339C d po c :=
  match h with
  | .inUnitedStates h      => Or.inl (corr2339Cb_inUS po h)
  | .outsideUnitedStates h => Or.inr (Or.inl (corr2339Cb_outUS po h))
  | .usVesselOrAircraft h  => Or.inr (Or.inr (Or.inl (corr2339Cb_vessel po h)))
  | .usOperatedAircraft h  => Or.inr (Or.inr (Or.inl (corr2339Cb_operated po h)))
  | .compelUnitedStates h  => Or.inr (Or.inr (Or.inr (corr2339Cb_compel po h)))


theorem predicateAct2339C_elements_implies_deontic
    {pa : Elements.PredicateAct} {c : ComplaintText}
    (h : Elements.PredicateActUnder2339C pa c) :
    Deontic.PredicateAct2339C (mapPredActED pa) c :=
  match h with
  | .treatyOffense h     => .treatyOffense (corr2339C_treaty h)
  | .civilianTargeting h => .intimidationOrCompulsion (corr2339C_clauseB h)



theorem s2339C_elements_implies_deontic
    {d : Person} {f : Elements.Funds} {pa : Elements.PredicateAct}
    {c : ComplaintText} (h : Elements.Section2339Ca1 d f pa c) :
    Deontic.Prohibition2339Ca1Violated d (mapFundsED f) (mapPredActED pa) c :=
  ⟨⟨corr2339C_addressee h.providesOrCollects,
    predicateAct2339C_elements_implies_deontic h.predicateAct,
    corr2339C_condition h.unlawfullyAndWillfully h.intentOrKnowledge,
    jurisdiction2339C_elements_implies_deontic (mapPredActED pa) h.jurisdiction⟩,
   corr2339C_act h.providesOrCollects⟩

axiom corr2339C_ontFunds {d : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.ProvidesOrCollectsFunds d f c →
    Ontology.IsFundsUnder2339C (mapFundsEO f) c
axiom corr2339C_ontProvides {d : Person} {f : Elements.Funds} {c : ComplaintText} :
    Elements.ProvidesOrCollectsFunds d f c →
    Ontology.IsProvides (conductFunding d f) c
axiom corr2339C_ontTreaty {pa : Elements.PredicateAct} {c : ComplaintText} :
    Elements.IsTreatyOffenseUnderSection2339Ce7 pa c →
    Ontology.IsActWithinScopeOfSpecifiedTreaty (mapPredActEO pa) c
axiom corr2339C_ontClauseB {pa : Elements.PredicateAct} {c : ComplaintText} :
    Elements.PredicateActClauseB pa c →
    Ontology.IsActIntendedToIntimidateOrCompel (mapPredActEO pa) c
axiom corr2339C_ontDenotes {pa : Elements.PredicateAct} {c : ComplaintText} :
    Elements.PredicateActUnder2339C pa c →
    Ontology.IsPredicateAct (mapPredActEO pa) c


theorem predicateAct2339C_elements_implies_ontology
    {pa : Elements.PredicateAct} {c : ComplaintText}
    (h : Elements.PredicateActUnder2339C pa c) :
    Ontology.PredicateActMembership (mapPredActEO pa) c :=
  ⟨match h with
   | .treatyOffense hx     => .treatyOffense (corr2339C_ontTreaty hx)
   | .civilianTargeting hx => .intimidateOrCompel (corr2339C_ontClauseB hx),
   corr2339C_ontDenotes h⟩


theorem s2339C_elements_implies_ontology
    {d : Person} {f : Elements.Funds} {pa : Elements.PredicateAct}
    {c : ComplaintText} (h : Elements.Section2339Ca1 d f pa c) :
    Ontology.Section2339CTermUse (mapFundsEO f) (conductFunding d f)
      (mapPredActEO pa) c :=
  ⟨corr2339C_ontFunds h.providesOrCollects,
   Ontology.FundingConduct.provides (corr2339C_ontProvides h.providesOrCollects),
   (predicateAct2339C_elements_implies_ontology h.predicateAct).denotes⟩

axiom mapFundsDOnt : Deontic.Funds → Ontology.FundsItem
axiom conductFundingD : Person → Deontic.Funds → Ontology.Conduct
axiom corr2339C_deonOntFunds {d : Person} {u : Deontic.Funds} {c : ComplaintText} :
    Deontic.RegulatedActOccurred2339Ca1 d u c →
    Ontology.IsFundsUnder2339C (mapFundsDOnt u) c
axiom corr2339C_deonOntProvides {d : Person} {u : Deontic.Funds} {c : ComplaintText} :
    Deontic.RegulatedActOccurred2339Ca1 d u c →
    Ontology.IsProvides (conductFundingD d u) c
axiom corr2339C_deonOntTreaty {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.IsTreatyOffense2339Ca1A o c → Ontology.IsPredicateAct (mapOffenseDO o) c
axiom corr2339C_deonOntClauseB {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.IsIntimidationOrCompulsionAct2339Ca1B o c →
    Ontology.IsPredicateAct (mapOffenseDO o) c


theorem s2339C_deontic_implies_ontology
    {d : Person} {u : Deontic.Funds} {o : Deontic.Offense} {c : ComplaintText}
    (h : Deontic.Prohibition2339Ca1Violated d u o c) :
    Ontology.Section2339CTermUse (mapFundsDOnt u) (conductFundingD d u)
      (mapOffenseDO o) c :=
  ⟨corr2339C_deonOntFunds h.2,
   Ontology.FundingConduct.provides (corr2339C_deonOntProvides h.2),
   match h.1.predicateAct with
   | .treatyOffense hx            => corr2339C_deonOntTreaty hx
   | .intimidationOrCompulsion hx => corr2339C_deonOntClauseB hx⟩



axiom corr2339Cc_inUS {d : Person} {c : ComplaintText} :
    IsPersonInUS d c → Deontic.IsInTheUnitedStates d c
axiom corr2339Cc_abroad {d : Person} {c : ComplaintText} :
    Elements.IsOutsideUSAndUSNationalOrEntity d c →
    (¬ Deontic.IsInTheUnitedStates d c) ∧
      Deontic.IsUnitedStatesNationalOrDomesticLegalEntity d c
axiom corr2339Cc_condition {d : Person} {m : Deontic.MaterialSupport}
    {c : ComplaintText} :
    Elements.Knowledge2339Cc2 d c → Deontic.ConditionMet2339Cc d m c
axiom corr2339Cc_act {d : Person} {m : Deontic.MaterialSupport} {c : ComplaintText} :
    Elements.KnowinglyConcealsOrDisguisesSupportOrFunds d c →
    Deontic.RegulatedActOccurred2339Cc d m c



theorem s2339Cc_elements_implies_deontic
    {d : Person} {c : ComplaintText} (m : Deontic.MaterialSupport)
    (h : Elements.Section2339Cc d c) :
    Deontic.Prohibition2339CcViolated d m c :=
  ⟨⟨match h.locus with
    | .inUnitedStates hx           => Or.inl (corr2339Cc_inUS hx)
    | .usNationalOrEntityAbroad hx => Or.inr (corr2339Cc_abroad hx),
    corr2339Cc_condition h.knowledge⟩,
   corr2339Cc_act h.conceals⟩









axiom corr2339Cf_addressee {le : Elements.LegalEntity} {c : ComplaintText} :
    Elements.IsLegalEntityLocatedInOrOrganizedUnderUSLaw le c →
    Deontic.IsDomesticLegalEntity2339Cf (mapEntityED le) c
axiom corr2339Cf_condition {d : Person} {le : Elements.LegalEntity}
    {f : Elements.Funds} {pa : Elements.PredicateAct} {c : ComplaintText} :
    Elements.IsResponsibleForManagementOrControl d le c →
    Elements.CommittedOffenseInThatCapacity d le c →
    Elements.Section2339Ca1 d f pa c →
    Deontic.ManagerCommittedSubsectionAOffense2339Cf (mapEntityED le) d c


theorem s2339Cf_elements_implies_deontic
    {d : Person} {le : Elements.LegalEntity} {f : Elements.Funds}
    {pa : Elements.PredicateAct} {c : ComplaintText}
    (h : Elements.Section2339Cf d le f pa c) :
    Deontic.Obligation2339Cf (mapEntityED le) d c :=
  ⟨corr2339Cf_addressee h.entityNexus,
   corr2339Cf_condition h.managerialRole h.inThatCapacity h.underlyingOffense⟩

axiom corr2339C_pJurInUS {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.OffenseInUSWithForeignOrPredicateNexus d c →
    Procedure.OffenseTakesPlaceInUnitedStates po c ∧
      Procedure.PerpetratorIsNationalOfAnotherStateOrStateless d c
axiom corr2339C_pJurOutUS {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.OffenseOutsideUSWithUnitedStatesNexus d c →
    (¬ Procedure.OffenseTakesPlaceInUnitedStates po c) ∧
      Procedure.PerpetratorIsUnitedStatesNationalOrStatelessResident d c
axiom corr2339C_pJurVessel {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.CommittedOnVesselOrAircraftOfUnitedStates d c →
    Procedure.OffenseCommittedOnBoardUnitedStatesFlagVesselOrRegisteredAircraft po c
axiom corr2339C_pJurOperated {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.CommittedOnAircraftOperatedByUnitedStates d c →
    Procedure.OffenseCommittedOnBoardAircraftOperatedByUnitedStates po c
axiom corr2339C_pJurCompel {d : Person} {c : ComplaintText} (po : Procedure.Offense) :
    Elements.DirectedAtCompellingUnitedStates d c →
    Procedure.PredicateActDirectedToCompelUnitedStates po c


theorem s2339C_elements_implies_procedure
    {d : Person} {c : ComplaintText} (po : Procedure.Offense)
    (h : Elements.JurisdictionUnder2339Cb d c) :
    Procedure.Section2339CJurisdictionEstablished d po c :=
  match h with
  | .inUnitedStates hx =>
      Or.inl ⟨(corr2339C_pJurInUS po hx).1, Or.inl (corr2339C_pJurInUS po hx).2⟩
  | .outsideUnitedStates hx =>
      Or.inr (Or.inl ⟨(corr2339C_pJurOutUS po hx).1,
                      Or.inl (corr2339C_pJurOutUS po hx).2⟩)
  | .usVesselOrAircraft hx =>
      Or.inr (Or.inr (Or.inl (corr2339C_pJurVessel po hx)))
  | .usOperatedAircraft hx =>
      Or.inr (Or.inr (Or.inr (Or.inl (corr2339C_pJurOperated po hx))))
  | .compelUnitedStates hx =>
      Or.inr (Or.inr (Or.inr (Or.inr (corr2339C_pJurCompel po hx))))





axiom corr2339D_addressee {d : Person} {t : Elements.Training}
    {o : Elements.Organization} {c : ComplaintText} :
    Elements.ReceivesMilitaryTypeTraining d t o c → Deontic.AddresseeInClass2339D d c
axiom corr2339D_training {t : Elements.Training} {c : ComplaintText} :
    Elements.IsMilitaryTypeTraining t c →
    Deontic.IsMilitaryTypeTraining2339D (mapTrainingED t) c
axiom corr2339D_designated {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} :
    Elements.OrganizationDesignatedAtTimeOfTraining o t c →
    Deontic.OrganizationDesignatedAtTimeOfTraining2339D (mapOrgED o) (mapTrainingED t) c
axiom corr2339D_scienter {d : Person} {o : Elements.Organization} {c : ComplaintText} :
    ActedWithScienter d c → Elements.KnowledgeOfTerroristOrganization d o c →
    Deontic.ConditionMet2339D d (mapOrgED o) c
axiom corr2339D_act {d : Person} {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} :
    Elements.ReceivesMilitaryTypeTraining d t o c →
    Deontic.RegulatedActOccurred2339D d (mapTrainingED t) (mapOrgED o) c


theorem s2339D_elements_implies_deontic
    {d : Person} {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} (po : Deontic.Offense)
    (h : Elements.Section2339Da d t o c) :
    Deontic.Prohibition2339DViolated d (mapTrainingED t) (mapOrgED o) po c :=
  ⟨⟨corr2339D_addressee h.receives,
    corr2339D_training h.militaryType,
    corr2339D_designated h.designatedAtTime,
    corr2339D_scienter h.knowingly h.organizationKnowledge,
    jurisdictionNexus_elements_implies_deontic po h.jurisdiction⟩,
   corr2339D_act h.receives⟩

axiom corr2339D_ontTraining {t : Elements.Training} {c : ComplaintText} :
    Elements.IsMilitaryTypeTraining t c →
    Ontology.IsMilitaryTypeTraining (mapTrainingEO t) c
axiom corr2339D_ontOrg {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} :
    Elements.OrganizationDesignatedAtTimeOfTraining o t c →
    Ontology.IsForeignTerroristOrganization (mapOrgEO o) c



theorem s2339D_elements_implies_ontology
    {d : Person} {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} (h : Elements.Section2339Da d t o c) :
    Ontology.Section2339DTermUse (mapTrainingEO t) (mapOrgEO o) c :=
  ⟨corr2339D_ontTraining h.militaryType, corr2339D_ontOrg h.designatedAtTime⟩

axiom corr2339D_deonOntTraining {t : Deontic.MilitaryTraining} {c : ComplaintText} :
    Deontic.IsMilitaryTypeTraining2339D t c →
    Ontology.IsMilitaryTypeTraining (mapTrainingDO t) c
axiom corr2339D_deonOntOrg {g : Deontic.Organization} {t : Deontic.MilitaryTraining}
    {c : ComplaintText} :
    Deontic.OrganizationDesignatedAtTimeOfTraining2339D g t c →
    Ontology.IsForeignTerroristOrganization (mapOrgDO g) c


theorem s2339D_deontic_implies_ontology
    {d : Person} {t : Deontic.MilitaryTraining} {g : Deontic.Organization}
    {o : Deontic.Offense} {c : ComplaintText}
    (h : Deontic.Prohibition2339DViolated d t g o c) :
    Ontology.Section2339DTermUse (mapTrainingDO t) (mapOrgDO g) c :=
  ⟨corr2339D_deonOntTraining h.1.training, corr2339D_deonOntOrg h.1.designated⟩

axiom corr2339D_pReceived {d : Person} {t : Elements.Training}
    {o : Elements.Organization} {c : ComplaintText} :
    Elements.ReceivesMilitaryTypeTraining d t o c →
    Procedure.TrainingReceivedFromOrOnBehalfOfOrganization d (mapOrgEP o) c
axiom corr2339D_pDesignated {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} :
    Elements.OrganizationDesignatedAtTimeOfTraining o t c →
    Procedure.OrganizationDesignatedAtTimeOfTraining (mapOrgEP o) c




theorem s2339D_elements_implies_procedure
    {d : Person} {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} (h : Elements.Section2339Da d t o c) :
    Procedure.Section2339DDesignationContemporaneousWithTraining d (mapOrgEP o) c :=
  ⟨corr2339D_pReceived h.receives, corr2339D_pDesignated h.designatedAtTime⟩


theorem s2339D_jurisdiction_elements_implies_procedure
    {d : Person} {t : Elements.Training} {o : Elements.Organization}
    {c : ComplaintText} (po : Procedure.Offense)
    (h : Elements.Section2339Da d t o c) :
    Procedure.Section2339DJurisdictionEstablished d po c :=
  jurisdictionNexus_elements_implies_procedure po h.jurisdiction

end Proving.USC.T18.Ch113B.MaterialSupport.Bridge
