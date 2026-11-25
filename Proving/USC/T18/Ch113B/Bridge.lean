


























































import Proving.USC.T18.Ch113B.Elements.Statute
import Proving.USC.T18.Ch113B.Deontic.Statute
import Proving.USC.T18.Ch113B.Ontology.Statute
import Proving.USC.T18.Ch113B.Procedure.Statute
import Proving.USC.T18.Ch113B.Remedy.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Bridge

open Proving.USC.Common







axiom mapDevice     : Elements.Weapon       → Deontic.Device
axiom mapFacility   : Elements.Target       → Deontic.Facility
axiom mapCountryD   : Elements.Country      → Deontic.Country
axiom mapTxD        : Elements.Transaction  → Deontic.Transaction
axiom mapActD       : Elements.TerroristAct → Deontic.TerroristAct
axiom mapOrgD       : Elements.Organization → Deontic.Organization

axiom mapActO       : Elements.TerroristAct → Ontology.Activity
axiom mapWarActO    : Elements.TerroristAct → Ontology.Act
axiom mapOffenceO   : Elements.TerroristAct → Ontology.Offense
axiom mapWeaponO    : Elements.Weapon       → Ontology.Weapon
axiom mapDeviceO    : Elements.Weapon       → Ontology.Device
axiom mapOrgMFO     : Elements.Organization → Ontology.MilitaryForce
axiom mapPersonMFO  : Person                → Ontology.MilitaryForce

axiom mapPersonOrgE : Person                → Elements.Organization
axiom mapProceeding : Procedure.Prosecution → Deontic.Proceeding







axiom corr2331_violentOrDangerous {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.ViolentOrDangerousAct2331 a c →
    Ontology.InvolvesViolentActsOrActsDangerousToHumanLife (mapActO a) c
axiom corr2331_dangerous {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.InvolvesActsDangerousToHumanLife a c →
    Ontology.InvolvesActsDangerousToHumanLife (mapActO a) c
axiom corr2331_intimidate {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.AppearsIntendedToIntimidateOrCoerceCivilianPopulation a c →
    Ontology.AppearsIntendedToIntimidateOrCoerceCivilianPopulation (mapActO a) c
axiom corr2331_influence {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.AppearsIntendedToInfluenceGovernmentPolicyByCoercion a c →
    Ontology.AppearsIntendedToInfluenceGovernmentPolicy (mapActO a) c
axiom corr2331_affect {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.AppearsIntendedToAffectGovernmentConductByMassDestruction a c →
    Ontology.AppearsIntendedToAffectGovernmentConduct (mapActO a) c
axiom corr2331_outside {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.OccursPrimarilyOutsideUnitedStates a c →
    Ontology.OccursPrimarilyOutsideTerritorialJurisdictionOfUS (mapActO a) c
axiom corr2331_transcends {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.TranscendsNationalBoundariesInMeansOrTargets a c →
    Ontology.TranscendsNationalBoundaries (mapActO a) c
axiom corr2331_within {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.OccursPrimarilyWithinUnitedStates a c →
    Ontology.OccursPrimarilyWithinTerritorialJurisdictionOfUS (mapActO a) c


theorem purpose2331_elements_implies_ontology
    {a : Elements.TerroristAct} {c : ComplaintText}
    (h : Elements.TerroristPurpose2331 a c) :
    Ontology.AppearsIntendedToIntimidateOrCoerceCivilianPopulation (mapActO a) c ∨
    Ontology.AppearsIntendedToInfluenceGovernmentPolicy (mapActO a) c ∨
    Ontology.AppearsIntendedToAffectGovernmentConduct (mapActO a) c :=
  match h with
  | .intimidatePopulation hp => Or.inl (corr2331_intimidate hp)
  | .influencePolicy hp      => Or.inr (Or.inl (corr2331_influence hp))
  | .affectConduct hp        => Or.inr (Or.inr (corr2331_affect hp))


theorem locus2331_elements_implies_ontology
    {a : Elements.TerroristAct} {c : ComplaintText}
    (h : Elements.InternationalLocus2331 a c) :
    Ontology.OccursPrimarilyOutsideTerritorialJurisdictionOfUS (mapActO a) c ∨
    Ontology.TranscendsNationalBoundaries (mapActO a) c :=
  match h with
  | .primarilyOutside hp => Or.inl (corr2331_outside hp)
  | .transcends hp       => Or.inr (corr2331_transcends hp)



theorem s2331_elements_implies_ontology
    {a : Elements.TerroristAct} {c : ComplaintText}
    (h : Elements.InternationalTerrorism2331 a c) :
    Ontology.InternationalTerrorismDefinition (mapActO a) c :=
  ⟨corr2331_violentOrDangerous h.conduct,
   purpose2331_elements_implies_ontology h.purpose,
   locus2331_elements_implies_ontology h.locus⟩




theorem s2331_domestic_elements_implies_ontology
    {a : Elements.TerroristAct} {c : ComplaintText}
    (h : Elements.DomesticTerrorism2331 a c) :
    Ontology.DomesticTerrorismDefinition (mapActO a) c :=
  ⟨corr2331_dangerous h.conduct,
   purpose2331_elements_implies_ontology h.purpose,
   corr2331_within h.locus⟩

axiom corr2331_declaredWar {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.OccursInCourseOfDeclaredWar a c →
    Ontology.OccursInCourseOfDeclaredWar (mapWarActO a) c
axiom corr2331_conflictNations {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.OccursInCourseOfArmedConflictBetweenNations a c →
    Ontology.OccursInCourseOfArmedConflictBetweenNations (mapWarActO a) c
axiom corr2331_conflictForces {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.OccursInCourseOfArmedConflictBetweenMilitaryForces a c →
    Ontology.OccursInCourseOfArmedConflictBetweenMilitaryForces (mapWarActO a) c


theorem s2331_actOfWar_elements_implies_ontology
    {a : Elements.TerroristAct} {c : ComplaintText}
    (h : Elements.ActOfWar2331 a c) : Ontology.ActOfWarDefinition (mapWarActO a) c :=
  match h with
  | .declaredWar hp            => .declaredWar (corr2331_declaredWar hp)
  | .conflictBetweenNations hp => .betweenNations (corr2331_conflictNations hp)
  | .conflictBetweenForces hp  => .betweenMilitaryForces (corr2331_conflictForces hp)

axiom corr2331_fto {o : Elements.Organization} {c : ComplaintText} :
    Elements.DesignatedForeignTerroristOrganization o c →
    Ontology.IsDesignatedForeignTerroristOrganization (mapOrgMFO o) c
axiom corr2331_sdgt {o : Elements.Organization} {c : ComplaintText} :
    Elements.DesignatedSpeciallyDesignatedGlobalTerrorist o c →
    Ontology.IsSpeciallyDesignatedGlobalTerrorist (mapOrgMFO o) c
axiom corr2331_courtDetermined {o : Elements.Organization} {c : ComplaintText} :
    Elements.CourtDeterminedNotMilitaryForce o c →
    Ontology.DeterminedByCourtNotToBeMilitaryForce (mapOrgMFO o) c



theorem s2331_militaryForce_elements_implies_ontology
    {o : Elements.Organization} {c : ComplaintText}
    (h : Elements.NotMilitaryForce2331 o c) :
    Ontology.ExcludedFromMilitaryForce (mapOrgMFO o) c :=
  match h with
  | .fto hp             => .designatedFTO (corr2331_fto hp)
  | .sdgt hp            => .designatedSDGT (corr2331_sdgt hp)
  | .courtDetermined hp => .courtDetermination (corr2331_courtDetermined hp)

axiom corr2331_p_fto {x : Person} {c : ComplaintText} :
    Procedure.DesignatedForeignTerroristOrganization x c →
    Elements.DesignatedForeignTerroristOrganization (mapPersonOrgE x) c
axiom corr2331_p_sdgt {x : Person} {c : ComplaintText} :
    Procedure.DesignatedSpeciallyDesignatedGlobalTerrorist x c →
    Elements.DesignatedSpeciallyDesignatedGlobalTerrorist (mapPersonOrgE x) c
axiom corr2331_p_court {x : Person} {c : ComplaintText} :
    Procedure.CourtDeterminedNotMilitaryForce x c →
    Elements.CourtDeterminedNotMilitaryForce (mapPersonOrgE x) c




theorem s2331_procedure_implies_elements
    {x : Person} {c : ComplaintText} (h : Procedure.MilitaryForceExclusion x c) :
    Elements.NotMilitaryForce2331 (mapPersonOrgE x) c :=
  match h with
  | .byForeignTerroristOrganizationDesignation hp => .fto (corr2331_p_fto hp)
  | .bySpeciallyDesignatedGlobalTerroristDesignation hp => .sdgt (corr2331_p_sdgt hp)
  | .byCourtDetermination hp => .courtDetermined (corr2331_p_court hp)





def Deontic2332Broken (p : Person) (c : ComplaintText) : Prop :=
  Deontic.Violated2332A p c ∨ Deontic.Violated2332B p c ∨ Deontic.Violated2332C p c

axiom corr2332_victimAbroad {v : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates v c → Elements.VictimOutsideUnitedStatesAtTime v c →
    Deontic.NationalOutsideUnitedStates2332A c
axiom corr2332_kills {p v : Person} {c : ComplaintText} :
    Elements.CausesDeathOfNational p v c → Deontic.KillsNationalOfUnitedStates2332A p c
axiom corr2332_abroad {p : Person} {c : ComplaintText} :
    Elements.DefendantOutsideUnitedStates p c → Deontic.ConductOccurredOutsideUnitedStates p c
axiom corr2332_attempt {p v : Person} {c : ComplaintText} :
    Elements.AttemptsToKillNational p v c → Deontic.AttemptsOrConspiresToKillNational2332B p c
axiom corr2332_conspiracy {p : Person} {ag : Agreement} {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c → Elements.CommitsOvertActInFurtheranceOfConspiracy p ag c →
    Deontic.AttemptsOrConspiresToKillNational2332B p c
axiom corr2332_violence {p : Person} {c : ComplaintText} :
    Elements.EngagesInPhysicalViolence p c → Deontic.EngagesInPhysicalViolence2332C p c
axiom corr2332_injuryRoute {p v : Person} {c : ComplaintText} :
    Elements.SeriousInjuryRoute2332 p v c →
    Deontic.IntendsOrCausesSeriousBodilyInjuryToNational2332C p c



theorem s2332_elements_implies_deontic
    {p v : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332Violation p v ag c) : Deontic2332Broken p c :=
  match h with
  | .killing hk =>
      Or.inl ⟨⟨corr2332_victimAbroad hk.victimIsNational hk.victimAbroad⟩,
              corr2332_kills hk.kills⟩
  | .attempt ha =>
      Or.inr (Or.inl ⟨⟨corr2332_abroad ha.defendantAbroad⟩, corr2332_attempt ha.attempt⟩)
  | .conspiracy hc =>
      Or.inr (Or.inl ⟨⟨corr2332_abroad hc.defendantAbroad⟩,
                      corr2332_conspiracy hc.agreement hc.overtAct⟩)
  | .violence hv =>
      Or.inr (Or.inr ⟨⟨corr2332_abroad hv.defendantAbroad,
                       corr2332_injuryRoute hv.injury⟩,
                      corr2332_violence hv.violence⟩)

axiom corr2332_e_violation_remedy {p v : Person} {ag : Agreement} {c : ComplaintText} :
    Elements.Section2332Violation p v ag c → Remedy.ViolatedSection2332 p c
axiom corr2332_cert_remedy {p : Person} {c : ComplaintText} :
    Elements.AttorneyGeneralWrittenCertificationFiled p c →
    Remedy.AttorneyGeneralCertificationFiled p c
axiom corr2332_certJudgment_remedy {p : Person} {c : ComplaintText} :
    Elements.CertifiedOffenseIntendedToCoerceIntimidateOrRetaliate p c →
    Remedy.OffenseIntendedToCoerceIntimidateOrRetaliate p c


theorem cert2332_of_violation {p v : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332Violation p v ag c) : Elements.Section2332Certification p c :=
  match h with
  | .killing hk    => hk.certification
  | .attempt ha    => ha.certification
  | .conspiracy hc => hc.certification
  | .violence hv   => hv.certification


theorem s2332_elements_implies_remedy
    {p v : Person} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332Violation p v ag c) : Remedy.CriminalRemedy2332 p c :=
  ⟨corr2332_e_violation_remedy h,
   corr2332_cert_remedy (cert2332_of_violation h).written,
   corr2332_certJudgment_remedy (cert2332_of_violation h).judgment⟩

axiom corr2332_d_violation_remedy {p : Person} {c : ComplaintText} :
    Deontic2332Broken p c → Remedy.ViolatedSection2332 p c



axiom corr2332_d_cert_remedy {p : Person} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.AttorneyGeneralWrittenCertification2332D pr c →
    Remedy.AttorneyGeneralCertificationFiled p c ∧
    Remedy.OffenseIntendedToCoerceIntimidateOrRetaliate p c





theorem s2332_deontic_implies_remedy
    {p : Person} {pr : Deontic.Proceeding} {c : ComplaintText}
    (h : Deontic2332Broken p c)
    (peer_cert : Deontic.AttorneyGeneralWrittenCertification2332D pr c) :
    Remedy.CriminalRemedy2332 p c :=
  ⟨corr2332_d_violation_remedy h,
   (corr2332_d_cert_remedy peer_cert).1,
   (corr2332_d_cert_remedy peer_cert).2⟩




axiom corr2332_e_cert_proc {p : Person} {pr : Procedure.Prosecution}
    {cert : Procedure.Certification} {c : ComplaintText} :
    Elements.AttorneyGeneralWrittenCertificationFiled p c →
    Procedure.WrittenCertificationFiledForProsecution pr cert c ∧
    Procedure.CertifyingOfficialAuthorized cert c
axiom corr2332_e_certJudgment_proc {p : Person} {cert : Procedure.Certification}
    {c : ComplaintText} :
    Elements.CertifiedOffenseIntendedToCoerceIntimidateOrRetaliate p c →
    Procedure.CertificationRecitesCoerciveIntentJudgment cert c




theorem s2332_elements_implies_procedure
    {p v : Person} {ag : Agreement} {pr : Procedure.Prosecution}
    {cert : Procedure.Certification} {c : ComplaintText}
    (h : Elements.Section2332Violation p v ag c)
    (procStep_undertaken : Procedure.ProsecutionUndertakenByUnitedStates pr c)
    (kernelGuard_certTiming :
      Procedure.section2332CertificationPrecedesCommencement pr cert c) :
    Procedure.Section2332ProsecutionAuthorized pr cert c :=
  ⟨procStep_undertaken,
   (corr2332_e_cert_proc (p := p) (pr := pr) (cert := cert)
     (cert2332_of_violation h).written).1,
   (corr2332_e_cert_proc (p := p) (pr := pr) (cert := cert)
     (cert2332_of_violation h).written).2,
   corr2332_e_certJudgment_proc (p := p) (cert2332_of_violation h).judgment,
   kernelGuard_certTiming⟩

axiom corr2332_proc_cert_deontic {pr : Procedure.Prosecution}
    {cert : Procedure.Certification} {c : ComplaintText} :
    Procedure.WrittenCertificationFiledForProsecution pr cert c →
    Procedure.CertifyingOfficialAuthorized cert c →
    Procedure.CertificationRecitesCoerciveIntentJudgment cert c →
    Deontic.AttorneyGeneralWrittenCertification2332D (mapProceeding pr) c




theorem s2332_procedure_implies_deontic
    {pr : Procedure.Prosecution} {cert : Procedure.Certification} {c : ComplaintText}
    (h : Procedure.Section2332ProsecutionAuthorized pr cert c) :
    ¬ Deontic.Violated2332D (mapProceeding pr) c :=
  fun hv => hv.2.2 (corr2332_proc_cert_deontic h.certified h.officialOk h.recitesJudgment)

axiom corr2332_r_cert_proc {p : Person} {pr : Procedure.Prosecution}
    {cert : Procedure.Certification} {c : ComplaintText} :
    Remedy.AttorneyGeneralCertificationFiled p c →
    Procedure.WrittenCertificationFiledForProsecution pr cert c ∧
    Procedure.CertifyingOfficialAuthorized cert c
axiom corr2332_r_purpose_proc {p : Person} {cert : Procedure.Certification}
    {c : ComplaintText} :
    Remedy.OffenseIntendedToCoerceIntimidateOrRetaliate p c →
    Procedure.CertificationRecitesCoerciveIntentJudgment cert c


theorem s2332_remedy_implies_procedure
    {p : Person} {pr : Procedure.Prosecution} {cert : Procedure.Certification}
    {c : ComplaintText}
    (h : Remedy.CriminalRemedy2332 p c)
    (procStep_undertaken : Procedure.ProsecutionUndertakenByUnitedStates pr c)
    (kernelGuard_certTiming :
      Procedure.section2332CertificationPrecedesCommencement pr cert c) :
    Procedure.Section2332ProsecutionAuthorized pr cert c :=
  ⟨procStep_undertaken,
   (corr2332_r_cert_proc (pr := pr) (cert := cert) h.certification).1,
   (corr2332_r_cert_proc (pr := pr) (cert := cert) h.certification).2,
   corr2332_r_purpose_proc (cert := cert) h.certifiedPurpose,
   kernelGuard_certTiming⟩



def Deontic2332aBroken (p : Person) (d : Deontic.Device) (c : ComplaintText) : Prop :=
  Deontic.Violated2332aA p d c ∨ Deontic.Violated2332aB p d c

axiom corr2332a_wmd_destructive {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsDestructiveDevice w c → Deontic.IsWeaponOfMassDestruction2332a (mapDevice w) c
axiom corr2332a_wmd_chemical {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsChemicalWeapon w c → Deontic.IsWeaponOfMassDestruction2332a (mapDevice w) c
axiom corr2332a_wmd_biological {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsBiologicalWeapon w c → Deontic.IsWeaponOfMassDestruction2332a (mapDevice w) c
axiom corr2332a_wmd_radiological {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsRadiationWeapon w c → Deontic.IsWeaponOfMassDestruction2332a (mapDevice w) c


theorem wmd2332a_elements_implies_deontic {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.WeaponOfMassDestruction2332a w c) :
    Deontic.IsWeaponOfMassDestruction2332a (mapDevice w) c :=
  match h with
  | .destructiveDevice hp => corr2332a_wmd_destructive hp
  | .chemical hp          => corr2332a_wmd_chemical hp
  | .biological hp        => corr2332a_wmd_biological hp
  | .radiological hp      => corr2332a_wmd_radiological hp

axiom corr2332a_uses {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.UsesWeapon p w c →
    Deontic.UsesThreatensAttemptsOrConspiresToUseWMD2332a p (mapDevice w) c
axiom corr2332a_threatens {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.ThreatensToUseWeapon p w c →
    Deontic.UsesThreatensAttemptsOrConspiresToUseWMD2332a p (mapDevice w) c
axiom corr2332a_attempts {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    Elements.AttemptsToUseWeapon p w c →
    Deontic.UsesThreatensAttemptsOrConspiresToUseWMD2332a p (mapDevice w) c
axiom corr2332a_conspires {p : Person} {w : Elements.Weapon} {ag : Agreement}
    {c : ComplaintText} :
    AgreementAmongTwoOrMore ag c →
    Deontic.UsesThreatensAttemptsOrConspiresToUseWMD2332a p (mapDevice w) c


theorem conduct2332a_elements_implies_deontic
    {p : Person} {w : Elements.Weapon} {ag : Agreement} {c : ComplaintText}
    (h : Elements.ProhibitedWeaponUse2332a p w ag c) :
    Deontic.UsesThreatensAttemptsOrConspiresToUseWMD2332a p (mapDevice w) c :=
  match h with
  | .uses hp      => corr2332a_uses hp
  | .threatens hp => corr2332a_threatens hp
  | .attempts hp  => corr2332a_attempts hp
  | .conspires hp => corr2332a_conspires (w := w) hp

axiom corr2332a_circ_national {v : Person} {p : Person} {c : ComplaintText} :
    Elements.DirectedAtNationalOutsideUnitedStates v c →
    Deontic.JurisdictionalCircumstance2332aA p c
axiom corr2332a_circ_withinUS {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.DirectedAtPersonOrPropertyWithinUnitedStates t c →
    Elements.InterstateCircumstance2332a p t c → Deontic.JurisdictionalCircumstance2332aA p c
axiom corr2332a_circ_usProperty {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.DirectedAtUnitedStatesProperty t c → Deontic.JurisdictionalCircumstance2332aA p c
axiom corr2332a_circ_foreignProperty {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.DirectedAtForeignGovernmentPropertyWithinUnitedStates t c →
    Deontic.JurisdictionalCircumstance2332aA p c
axiom corr2332a_noAuthority {p : Person} {c : ComplaintText} :
    Elements.ActsWithoutLawfulAuthority p c → ¬ Deontic.HasLawfulAuthority2332a p c
axiom corr2332a_abroad {c : ComplaintText} {p : Person} :
    Elements.ConductOccursOutsideUnitedStates c → Deontic.ConductOccurredOutsideUnitedStates p c
axiom corr2332a_national {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c → Deontic.IsNationalOfUnitedStates p c



theorem s2332a_elements_implies_deontic
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section2332aViolation p v w t ag c) :
    Deontic2332aBroken p (mapDevice w) c :=
  match h with
  | .nationalAbroad hk =>
      Or.inl ⟨⟨wmd2332a_elements_implies_deontic hk.weapon,
               corr2332a_circ_national (p := p) hk.target⟩,
              conduct2332a_elements_implies_deontic hk.conduct,
              corr2332a_noAuthority hk.noAuthority⟩
  | .withinUnitedStates hk =>
      Or.inl ⟨⟨wmd2332a_elements_implies_deontic hk.weapon,
               corr2332a_circ_withinUS hk.target hk.commerce⟩,
              conduct2332a_elements_implies_deontic hk.conduct,
              corr2332a_noAuthority hk.noAuthority⟩
  | .unitedStatesProperty hk =>
      Or.inl ⟨⟨wmd2332a_elements_implies_deontic hk.weapon,
               corr2332a_circ_usProperty (p := p) hk.target⟩,
              conduct2332a_elements_implies_deontic hk.conduct,
              corr2332a_noAuthority hk.noAuthority⟩
  | .foreignGovernmentProperty hk =>
      Or.inl ⟨⟨wmd2332a_elements_implies_deontic hk.weapon,
               corr2332a_circ_foreignProperty (p := p) hk.target⟩,
              conduct2332a_elements_implies_deontic hk.conduct,
              corr2332a_noAuthority hk.noAuthority⟩
  | .byNationalAbroad hk =>
      Or.inr ⟨⟨corr2332a_national hk.national,
               wmd2332a_elements_implies_deontic hk.weapon,
               corr2332a_abroad (p := p) hk.abroad⟩,
              conduct2332a_elements_implies_deontic hk.conduct,
              corr2332a_noAuthority hk.noAuthority⟩

axiom corr2332a_e_violation_remedy {p v : Person} {w : Elements.Weapon}
    {t : Elements.Target} {ag : Agreement} {c : ComplaintText} :
    Elements.Section2332aViolation p v w t ag c → Remedy.ViolatedSection2332a p c
axiom corr2332a_d_violation_remedy {p : Person} {d : Deontic.Device} {c : ComplaintText} :
    Deontic2332aBroken p d c → Remedy.ViolatedSection2332a p c




theorem s2332a_elements_implies_remedy
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section2332aViolation p v w t ag c) : Remedy.CriminalRemedy2332a p c :=
  ⟨corr2332a_e_violation_remedy h⟩


theorem s2332a_deontic_implies_remedy
    {p : Person} {d : Deontic.Device} {c : ComplaintText}
    (h : Deontic2332aBroken p d c) : Remedy.CriminalRemedy2332a p c :=
  ⟨corr2332a_d_violation_remedy h⟩

axiom corr2332a_e_juris_proc {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {ag : Agreement} {c : ComplaintText} (o : Procedure.Offense) :
    Elements.Section2332aViolation p v w t ag c → Procedure.Section2332aJurisdiction p o c
axiom corr2332a_d_juris_proc {p : Person} {d : Deontic.Device} {c : ComplaintText}
    (o : Procedure.Offense) :
    Deontic2332aBroken p d c → Procedure.Section2332aJurisdiction p o c
axiom corr2332a_r_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Remedy.CriminalRemedy2332a p c → Procedure.Section2332aJurisdiction p o c


theorem s2332a_elements_implies_procedure
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (o : Procedure.Offense)
    (h : Elements.Section2332aViolation p v w t ag c) :
    Procedure.Section2332aJurisdiction p o c :=
  corr2332a_e_juris_proc o h


theorem s2332a_deontic_implies_procedure
    {p : Person} {d : Deontic.Device} {c : ComplaintText} (o : Procedure.Offense)
    (h : Deontic2332aBroken p d c) : Procedure.Section2332aJurisdiction p o c :=
  corr2332a_d_juris_proc o h


theorem s2332a_remedy_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Remedy.CriminalRemedy2332a p c) : Procedure.Section2332aJurisdiction p o c :=
  corr2332a_r_juris_proc o h

axiom corr2332a_wmdO_destructive {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsDestructiveDevice w c → Ontology.IsDestructiveDevice (mapWeaponO w) c
axiom corr2332a_wmdO_chemical {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsChemicalWeapon w c → Ontology.IsToxicOrPoisonousChemicalWeapon (mapWeaponO w) c
axiom corr2332a_wmdO_biological {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsBiologicalWeapon w c → Ontology.IsBiologicalAgentWeapon (mapWeaponO w) c
axiom corr2332a_wmdO_radiological {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsRadiationWeapon w c → Ontology.IsRadiationReleasingWeapon (mapWeaponO w) c


theorem s2332a_elements_implies_ontology {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.WeaponOfMassDestruction2332a w c) :
    Ontology.WeaponOfMassDestructionDefinition (mapWeaponO w) c :=
  match h with
  | .destructiveDevice hp => .destructiveDevice (corr2332a_wmdO_destructive hp)
  | .chemical hp          => .chemical (corr2332a_wmdO_chemical hp)
  | .biological hp        => .biological (corr2332a_wmdO_biological hp)
  | .radiological hp      => .radiological (corr2332a_wmdO_radiological hp)



def Deontic2332bBroken (p : Person) (c : ComplaintText) : Prop :=
  Deontic.Violated2332bA1 p c ∨ Deontic.Violated2332bA2 p c

axiom corr2332b_transcends {p : Person} {c : ComplaintText} :
    Elements.ConductTranscendsNationalBoundaries c →
    Deontic.ConductTranscendsNationalBoundaries2332bA1 p c
axiom corr2332b_unlawful {p : Person} {c : ComplaintText} :
    Elements.InViolationOfStateOrFederalLaw c →
    Deontic.InViolationOfStateOrFederalLaw2332bA1 p c
axiom corr2332b_circumstance {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.JurisdictionalCircumstance2332b p v t c →
    Deontic.JurisdictionalCircumstance2332bB1 p c
axiom corr2332b_act {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.PredicateAct2332b p v t c → Deontic.CommitsEnumeratedViolentAct2332bA1 p c
axiom corr2332b_inchoate {p : Person} {ag : Agreement} {c : ComplaintText} :
    Elements.Inchoate2332b p ag c → Deontic.ThreatensAttemptsOrConspires2332bA2 p c


theorem s2332b_elements_implies_deontic
    {p v : Person} {t : Elements.Target} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332bViolation p v t ag c) : Deontic2332bBroken p c :=
  match h with
  | .completed hk =>
      Or.inl ⟨⟨corr2332b_transcends hk.transcends,
               corr2332b_circumstance hk.circumstance,
               corr2332b_unlawful hk.unlawful⟩,
              corr2332b_act hk.act⟩
  | .inchoate hk =>
      Or.inr ⟨⟨corr2332b_transcends hk.transcends,
               corr2332b_circumstance hk.circumstance⟩,
              corr2332b_inchoate hk.inchoate⟩

axiom corr2332b_e_violation_remedy {p v : Person} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} :
    Elements.Section2332bViolation p v t ag c → Remedy.ViolatedSection2332b p c
axiom corr2332b_e_juris_remedy {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.JurisdictionalCircumstance2332b p v t c →
    Remedy.JurisdictionalNexusEstablished p c
axiom corr2332b_d_violation_remedy {p : Person} {c : ComplaintText} :
    Deontic2332bBroken p c → Remedy.ViolatedSection2332b p c
axiom corr2332b_d_juris_remedy {p : Person} {c : ComplaintText} :
    Deontic.JurisdictionalCircumstance2332bB1 p c → Remedy.JurisdictionalNexusEstablished p c


theorem circ2332b_of_violation {p v : Person} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (h : Elements.Section2332bViolation p v t ag c) :
    Elements.JurisdictionalCircumstance2332b p v t c :=
  match h with
  | .completed hk => hk.circumstance
  | .inchoate hk  => hk.circumstance


theorem s2332b_elements_implies_remedy
    {p v : Person} {t : Elements.Target} {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332bViolation p v t ag c) : Remedy.CriminalRemedy2332b p c :=
  ⟨corr2332b_e_violation_remedy h, corr2332b_e_juris_remedy (circ2332b_of_violation h)⟩


theorem circ2332b_of_deontic {p : Person} {c : ComplaintText}
    (h : Deontic2332bBroken p c) : Deontic.JurisdictionalCircumstance2332bB1 p c :=
  match h with
  | .inl hk => hk.1.circumstance
  | .inr hk => hk.1.circumstance


theorem s2332b_deontic_implies_remedy {p : Person} {c : ComplaintText}
    (h : Deontic2332bBroken p c) : Remedy.CriminalRemedy2332b p c :=
  ⟨corr2332b_d_violation_remedy h, corr2332b_d_juris_remedy (circ2332b_of_deontic h)⟩

axiom corr2332b_e_role_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Elements.IsPrincipalCoConspiratorOrAccessory p c →
    Procedure.IsPrincipalCoconspiratorOrAccessoryAfterTheFact p o c
axiom corr2332b_e_oneOffender_proc {c : ComplaintText} (o : Procedure.Offense) :
    Elements.CircumstanceAppliesToAtLeastOneOffender c →
    Procedure.Section2332bCircumstanceAppliesToAtLeastOneOffender o c




theorem s2332b_elements_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Elements.Section2332bDerivativeJurisdiction p c) :
    Procedure.Section2332bJurisdictionOverActor p o c :=
  ⟨corr2332b_e_role_proc o h.role, corr2332b_e_oneOffender_proc o h.circumstance⟩

axiom corr2332b_d_oneOffender_proc {c : ComplaintText} (o : Procedure.Offense) :
    Deontic.CircumstanceAppliesToAtLeastOneOffender2332bB2 c →
    Procedure.Section2332bCircumstanceAppliesToAtLeastOneOffender o c




theorem s2332b_deontic_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Deontic.Power2332bB2 c)
    (peer_role : Procedure.IsPrincipalCoconspiratorOrAccessoryAfterTheFact p o c) :
    Procedure.Section2332bJurisdictionOverActor p o c :=
  ⟨peer_role, corr2332b_d_oneOffender_proc o h.condition⟩

axiom corr2332b_r_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Remedy.JurisdictionalNexusEstablished p c →
    Procedure.Section2332bCircumstanceAppliesToAtLeastOneOffender o c


theorem s2332b_remedy_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Remedy.CriminalRemedy2332b p c)
    (peer_role : Procedure.IsPrincipalCoconspiratorOrAccessoryAfterTheFact p o c) :
    Procedure.Section2332bJurisdictionOverActor p o c :=
  ⟨peer_role, corr2332b_r_juris_proc o h.jurisdiction⟩

axiom corr2332b_calculated {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.CalculatedToInfluenceGovernmentOrRetaliate a c →
    Ontology.IsCalculatedToInfluenceOrRetaliateAgainstGovernment (mapOffenceO a) c
axiom corr2332b_enumerated {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.ViolatesEnumeratedTerrorismOffense a c →
    Ontology.IsEnumeratedTerrorismPredicateOffense (mapOffenceO a) c


theorem s2332b_elements_implies_ontology {a : Elements.TerroristAct} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism2332b a c) :
    Ontology.FederalCrimeOfTerrorismDefinition (mapOffenceO a) c :=
  ⟨corr2332b_calculated h.calculated, corr2332b_enumerated h.enumerated⟩



axiom corr2332d_usPerson {p : Person} {c : ComplaintText} :
    Elements.UnitedStatesPerson2332d p c → Deontic.IsUnitedStatesPerson p c
axiom corr2332d_designated {k : Elements.Country} {c : ComplaintText} :
    Elements.CountryDesignatedAsSupportingInternationalTerrorism k c →
    Deontic.CountryDesignatedAsSupportingInternationalTerrorism2332d (mapCountryD k) c
axiom corr2332d_scienter {p : Person} {k : Elements.Country} {c : ComplaintText} :
    Elements.KnowsOrHasReasonableCauseToKnowCountryDesignated p k c →
    Deontic.KnowsOrHasReasonableCauseToKnowDesignation2332d p (mapCountryD k) c
axiom corr2332d_conduct {p : Person} {k : Elements.Country} {tx : Elements.Transaction}
    {c : ComplaintText} :
    Elements.EngagesInFinancialTransactionWithGovernmentOfCountry p k tx c →
    Elements.IsFinancialTransaction tx c →
    Deontic.EngagesInFinancialTransactionWithGovernment2332d p (mapTxD tx) (mapCountryD k) c
axiom corr2332d_exempt {p : Person} {tx : Elements.Transaction} {c : ComplaintText} :
    Deontic.TreasuryRegulationExempts2332d p (mapTxD tx) c →
    Elements.ExemptedByTreasuryRegulation p tx c


theorem s2332d_elements_implies_deontic
    {p : Person} {k : Elements.Country} {tx : Elements.Transaction} {c : ComplaintText}
    (h : Elements.Section2332dFinancialTransaction p k tx c) :
    Deontic.Violated2332d p (mapTxD tx) (mapCountryD k) c :=
  ⟨⟨corr2332d_usPerson h.usPerson, corr2332d_designated h.designated,
    corr2332d_scienter h.scienter⟩,
   corr2332d_conduct h.conduct h.isFinancial,
   fun hEx => h.notExempt (corr2332d_exempt hEx)⟩

axiom corr2332d_e_violation_remedy {p : Person} {k : Elements.Country}
    {tx : Elements.Transaction} {c : ComplaintText} :
    Elements.Section2332dFinancialTransaction p k tx c → Remedy.ViolatedSection2332d p c
axiom corr2332d_r_exempt {p : Person} {tx : Elements.Transaction} {c : ComplaintText} :
    Remedy.TreasuryRegulationExemption p c → Elements.ExemptedByTreasuryRegulation p tx c


theorem s2332d_elements_implies_remedy
    {p : Person} {k : Elements.Country} {tx : Elements.Transaction} {c : ComplaintText}
    (h : Elements.Section2332dFinancialTransaction p k tx c) :
    Remedy.CriminalRemedy2332d p c :=
  ⟨corr2332d_e_violation_remedy h,
   fun hEx => h.notExempt (corr2332d_r_exempt (tx := tx) hEx)⟩

axiom corr2332d_d_violation_remedy {p : Person} {t : Deontic.Transaction}
    {k : Deontic.Country} {c : ComplaintText} :
    Deontic.Violated2332d p t k c → Remedy.ViolatedSection2332d p c
axiom corr2332d_r_exempt_deontic {p : Person} {t : Deontic.Transaction} {c : ComplaintText} :
    Remedy.TreasuryRegulationExemption p c → Deontic.TreasuryRegulationExempts2332d p t c


theorem s2332d_deontic_implies_remedy
    {p : Person} {t : Deontic.Transaction} {k : Deontic.Country} {c : ComplaintText}
    (h : Deontic.Violated2332d p t k c) : Remedy.CriminalRemedy2332d p c :=
  ⟨corr2332d_d_violation_remedy h, fun hEx => h.2.2 (corr2332d_r_exempt_deontic hEx)⟩

axiom corr2332d_e_usPerson_proc {p : Person} {c : ComplaintText} :
    Elements.UnitedStatesPerson2332d p c → Procedure.IsUnitedStatesPerson p c
axiom corr2332d_e_designated_proc {k : Elements.Country} {c : ComplaintText}
    (s : Procedure.ForeignState) :
    Elements.CountryDesignatedAsSupportingInternationalTerrorism k c →
    Procedure.CountryDesignatedAsSupportingInternationalTerrorism s c
axiom corr2332d_e_exception_proc {p : Person} {tx : Elements.Transaction}
    {c : ComplaintText} {s : Procedure.ForeignState} {r : Procedure.Regulation} :
    Procedure.Section2332dRegulatoryException r p s c →
    Elements.ExemptedByTreasuryRegulation p tx c




theorem s2332d_elements_implies_procedure
    {p : Person} {k : Elements.Country} {tx : Elements.Transaction} {c : ComplaintText}
    (s : Procedure.ForeignState)
    (h : Elements.Section2332dFinancialTransaction p k tx c)
    (kernelGuard_designationInForce :
      Procedure.section2332dDesignationInForceAtTransaction p s c) :
    Procedure.Section2332dProsecutionPredicate p s c :=
  ⟨corr2332d_e_usPerson_proc h.usPerson,
   corr2332d_e_designated_proc s h.designated,
   kernelGuard_designationInForce,
   fun hEx => hEx.elim (fun _r hr => h.notExempt (corr2332d_e_exception_proc (tx := tx) hr))⟩

axiom corr2332d_d_usPerson_proc {p : Person} {c : ComplaintText} :
    Deontic.IsUnitedStatesPerson p c → Procedure.IsUnitedStatesPerson p c
axiom corr2332d_d_designated_proc {k : Deontic.Country} {c : ComplaintText}
    (s : Procedure.ForeignState) :
    Deontic.CountryDesignatedAsSupportingInternationalTerrorism2332d k c →
    Procedure.CountryDesignatedAsSupportingInternationalTerrorism s c
axiom corr2332d_d_exception_proc {p : Person} {t : Deontic.Transaction} {c : ComplaintText}
    {s : Procedure.ForeignState} {r : Procedure.Regulation} :
    Procedure.Section2332dRegulatoryException r p s c →
    Deontic.TreasuryRegulationExempts2332d p t c


theorem s2332d_deontic_implies_procedure
    {p : Person} {t : Deontic.Transaction} {k : Deontic.Country} {c : ComplaintText}
    (s : Procedure.ForeignState)
    (h : Deontic.Violated2332d p t k c)
    (kernelGuard_designationInForce :
      Procedure.section2332dDesignationInForceAtTransaction p s c) :
    Procedure.Section2332dProsecutionPredicate p s c :=
  ⟨corr2332d_d_usPerson_proc h.1.addressee,
   corr2332d_d_designated_proc s h.1.designated,
   kernelGuard_designationInForce,
   fun hEx => hEx.elim (fun _r hr => h.2.2 (corr2332d_d_exception_proc (t := t) hr))⟩

axiom corr2332d_r_usPerson_proc {p : Person} {c : ComplaintText} :
    Remedy.ViolatedSection2332d p c → Procedure.IsUnitedStatesPerson p c
axiom corr2332d_r_designated_proc {p : Person} {c : ComplaintText}
    (s : Procedure.ForeignState) :
    Remedy.ViolatedSection2332d p c →
    Procedure.CountryDesignatedAsSupportingInternationalTerrorism s c
axiom corr2332d_r_exception_proc {p : Person} {c : ComplaintText}
    {s : Procedure.ForeignState} {r : Procedure.Regulation} :
    Procedure.Section2332dRegulatoryException r p s c → Remedy.TreasuryRegulationExemption p c


theorem s2332d_remedy_implies_procedure
    {p : Person} {c : ComplaintText} (s : Procedure.ForeignState)
    (h : Remedy.CriminalRemedy2332d p c)
    (kernelGuard_designationInForce :
      Procedure.section2332dDesignationInForceAtTransaction p s c) :
    Procedure.Section2332dProsecutionPredicate p s c :=
  ⟨corr2332d_r_usPerson_proc h.violation,
   corr2332d_r_designated_proc s h.violation,
   kernelGuard_designationInForce,
   fun hEx => hEx.elim (fun _r hr => h.notExempt (corr2332d_r_exception_proc hr))⟩

axiom corr2332d_o_citizen {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c → Ontology.IsUnitedStatesCitizenOrNational p c
axiom corr2332d_o_resident {p : Person} {c : ComplaintText} :
    Elements.IsPermanentResidentAlien p c → Ontology.IsPermanentResidentAlien p c
axiom corr2332d_o_juridical {p : Person} {c : ComplaintText} :
    Elements.IsJuridicalPersonOrganizedUnderUnitedStatesLaw p c →
    Ontology.IsJuridicalPersonOrganizedUnderUnitedStatesLaw p c
axiom corr2332d_o_inUS {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Ontology.IsPersonInUS p c



theorem s2332d_elements_implies_ontology {p : Person} {c : ComplaintText}
    (h : Elements.UnitedStatesPerson2332d p c) :
    Ontology.UnitedStatesPersonDefinition p c :=
  match h with
  | .citizenOrNational hp => .citizenOrNational (corr2332d_o_citizen hp)
  | .permanentResident hp => .permanentResident (corr2332d_o_resident hp)
  | .juridical hp         => .juridicalPerson (corr2332d_o_juridical hp)
  | .inUnitedStates hp    => .presentInUS (corr2332d_o_inUS hp)



def Deontic2332fBroken (p : Person) (d : Deontic.Device) (f : Deontic.Facility)
    (c : ComplaintText) : Prop :=
  Deontic.Violated2332fA1 p d f c ∨ Deontic.Violated2332fA2 p c

axiom corr2332f_device {w : Elements.Weapon} {c : ComplaintText} :
    Elements.ExplosiveOrLethalDevice2332f w c →
    Deontic.IsExplosiveOrOtherLethalDevice2332f (mapDevice w) c
axiom corr2332f_target {t : Elements.Target} {c : ComplaintText} :
    Elements.BombingTarget2332f t c → Deontic.IsCoveredPlaceOrFacility2332f (mapFacility t) c
axiom corr2332f_intent {p : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.BombingIntent2332f p t c →
    Deontic.IntendsDeathInjuryOrExtensiveDestruction2332fA1 p c
axiom corr2332f_juris {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332f p v t c → Deontic.JurisdictionalCircumstance2332fB p c
axiom corr2332f_conduct {p : Person} {w : Elements.Weapon} {t : Elements.Target}
    {c : ComplaintText} :
    Elements.UnlawfullyDeliversPlacesDischargesOrDetonatesDevice p w t c →
    Deontic.DeliversPlacesDischargesOrDetonates2332fA1 p (mapDevice w) (mapFacility t) c
axiom corr2332f_inchoate {p : Person} {ag : Agreement} {c : ComplaintText} :
    Elements.Inchoate2332f p ag c → Deontic.AttemptsOrConspires2332fA2 p c


axiom corr2332f_inapplicable {p : Person} {c : ComplaintText} :
    Deontic.SectionInapplicable2332fD p c →
    Elements.ActivitiesOfArmedForcesDuringArmedConflict c ∨
    Elements.ActivitiesOfMilitaryForcesInOfficialDuties c ∨
    Elements.PurelyDomesticOffenseWithoutSubstantialCommerceEffect c


theorem notExcluded2332f_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.NotExcluded2332f c) : ¬ Deontic.SectionInapplicable2332fD p c :=
  fun hInap => match corr2332f_inapplicable hInap with
    | .inl h1              => h.notArmedForces h1
    | .inr (.inl h2)       => h.notMilitaryDuty h2
    | .inr (.inr h3)       => h.notPurelyDomestic h3


theorem s2332f_elements_implies_deontic
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section2332fViolation p v w t ag c) :
    Deontic2332fBroken p (mapDevice w) (mapFacility t) c :=
  match h with
  | .completed hk =>
      Or.inl ⟨⟨corr2332f_device hk.device, corr2332f_target hk.target,
               corr2332f_intent hk.intent, corr2332f_juris hk.jurisdiction⟩,
              corr2332f_conduct hk.conduct,
              notExcluded2332f_elements_implies_deontic hk.notExcluded⟩
  | .inchoate hk =>
      Or.inr ⟨⟨corr2332f_juris hk.jurisdiction⟩,
              corr2332f_inchoate hk.inchoate,
              notExcluded2332f_elements_implies_deontic hk.notExcluded⟩

axiom corr2332f_e_violation_remedy {p v : Person} {w : Elements.Weapon}
    {t : Elements.Target} {ag : Agreement} {c : ComplaintText} :
    Elements.Section2332fViolation p v w t ag c → Remedy.ViolatedSection2332f p c
axiom corr2332f_e_juris_remedy {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332f p v t c → Remedy.JurisdictionalNexusEstablished p c
axiom corr2332f_r_armedForces {p : Person} {c : ComplaintText} :
    Remedy.ArmedForcesOrMilitaryForcesExclusion p c →
    Elements.ActivitiesOfArmedForcesDuringArmedConflict c ∨
    Elements.ActivitiesOfMilitaryForcesInOfficialDuties c
axiom corr2332f_r_nationalityOnly {p : Person} {c : ComplaintText} :
    Remedy.NationalityOnlyDomesticOffenseExclusion p c →
    Elements.PurelyDomesticOffenseWithoutSubstantialCommerceEffect c



theorem parts2332f_of_violation {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {ag : Agreement} {c : ComplaintText} (h : Elements.Section2332fViolation p v w t ag c) :
    Elements.Jurisdiction2332f p v t c ∧ Elements.NotExcluded2332f c :=
  match h with
  | .completed hk => ⟨hk.jurisdiction, hk.notExcluded⟩
  | .inchoate hk  => ⟨hk.jurisdiction, hk.notExcluded⟩




theorem s2332f_elements_implies_remedy
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section2332fViolation p v w t ag c) : Remedy.CriminalRemedy2332f p c :=
  ⟨corr2332f_e_violation_remedy h,
   corr2332f_e_juris_remedy (parts2332f_of_violation h).1,
   fun hEx => match corr2332f_r_armedForces hEx with
     | .inl h1 => (parts2332f_of_violation h).2.notArmedForces h1
     | .inr h2 => (parts2332f_of_violation h).2.notMilitaryDuty h2,
   fun hEx => (parts2332f_of_violation h).2.notPurelyDomestic
     (corr2332f_r_nationalityOnly hEx)⟩

axiom corr2332f_d_violation_remedy {p : Person} {d : Deontic.Device}
    {f : Deontic.Facility} {c : ComplaintText} :
    Deontic2332fBroken p d f c → Remedy.ViolatedSection2332f p c
axiom corr2332f_d_juris_remedy {p : Person} {c : ComplaintText} :
    Deontic.JurisdictionalCircumstance2332fB p c → Remedy.JurisdictionalNexusEstablished p c
axiom corr2332f_r_armedForces_deontic {p : Person} {c : ComplaintText} :
    Remedy.ArmedForcesOrMilitaryForcesExclusion p c → Deontic.SectionInapplicable2332fD p c
axiom corr2332f_r_nationalityOnly_deontic {p : Person} {c : ComplaintText} :
    Remedy.NationalityOnlyDomesticOffenseExclusion p c →
    Deontic.SectionInapplicable2332fD p c


theorem parts2332f_of_deontic {p : Person} {d : Deontic.Device} {f : Deontic.Facility}
    {c : ComplaintText} (h : Deontic2332fBroken p d f c) :
    Deontic.JurisdictionalCircumstance2332fB p c ∧ ¬ Deontic.SectionInapplicable2332fD p c :=
  match h with
  | .inl hk => ⟨hk.1.jurisdiction, hk.2.2⟩
  | .inr hk => ⟨hk.1.jurisdiction, hk.2.2⟩


theorem s2332f_deontic_implies_remedy
    {p : Person} {d : Deontic.Device} {f : Deontic.Facility} {c : ComplaintText}
    (h : Deontic2332fBroken p d f c) : Remedy.CriminalRemedy2332f p c :=
  ⟨corr2332f_d_violation_remedy h,
   corr2332f_d_juris_remedy (parts2332f_of_deontic h).1,
   fun hEx => (parts2332f_of_deontic h).2 (corr2332f_r_armedForces_deontic hEx),
   fun hEx => (parts2332f_of_deontic h).2 (corr2332f_r_nationalityOnly_deontic hEx)⟩

axiom corr2332f_e_juris_proc {p v : Person} {t : Elements.Target} {c : ComplaintText}
    (o : Procedure.Offense) :
    Elements.Jurisdiction2332f p v t c → Procedure.section2332fJurisdiction o c
axiom corr2332f_p_inapplicable {c : ComplaintText} (o : Procedure.Offense) :
    Procedure.section2332fInapplicable o c →
    Elements.ActivitiesOfArmedForcesDuringArmedConflict c ∨
    Elements.ActivitiesOfMilitaryForcesInOfficialDuties c ∨
    Elements.PurelyDomesticOffenseWithoutSubstantialCommerceEffect c



theorem s2332f_elements_implies_procedure
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (o : Procedure.Offense)
    (h : Elements.Section2332fViolation p v w t ag c) :
    Procedure.Section2332fSectionApplies o c :=
  ⟨corr2332f_e_juris_proc o (parts2332f_of_violation h).1,
   fun hBar => match corr2332f_p_inapplicable o hBar with
     | .inl h1        => (parts2332f_of_violation h).2.notArmedForces h1
     | .inr (.inl h2) => (parts2332f_of_violation h).2.notMilitaryDuty h2
     | .inr (.inr h3) => (parts2332f_of_violation h).2.notPurelyDomestic h3⟩

axiom corr2332f_d_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Deontic.JurisdictionalCircumstance2332fB p c → Procedure.section2332fJurisdiction o c
axiom corr2332f_p_inapplicable_deontic {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332fInapplicable o c → Deontic.SectionInapplicable2332fD p c


theorem s2332f_deontic_implies_procedure
    {p : Person} {d : Deontic.Device} {f : Deontic.Facility} {c : ComplaintText}
    (o : Procedure.Offense) (h : Deontic2332fBroken p d f c) :
    Procedure.Section2332fSectionApplies o c :=
  ⟨corr2332f_d_juris_proc o (parts2332f_of_deontic h).1,
   fun hBar => (parts2332f_of_deontic h).2 (corr2332f_p_inapplicable_deontic o hBar)⟩

axiom corr2332f_r_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Remedy.JurisdictionalNexusEstablished p c → Procedure.section2332fJurisdiction o c
axiom corr2332f_p_inapplicable_remedy {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332fInapplicable o c →
    Remedy.ArmedForcesOrMilitaryForcesExclusion p c ∨
    Remedy.NationalityOnlyDomesticOffenseExclusion p c


theorem s2332f_remedy_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Remedy.CriminalRemedy2332f p c) : Procedure.Section2332fSectionApplies o c :=
  ⟨corr2332f_r_juris_proc o h.jurisdiction,
   fun hBar => match corr2332f_p_inapplicable_remedy (p := p) o hBar with
     | .inl h1 => h.notArmedConflict h1
     | .inr h2 => h.notNationalityOnly h2⟩

axiom corr2332f_o_explosive {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsExplosive w c → Ontology.IsExplosive (mapDeviceO w) c
axiom corr2332f_o_otherLethal {w : Elements.Weapon} {c : ComplaintText} :
    Elements.IsOtherLethalDevice w c → Ontology.IsOtherLethalDevice (mapDeviceO w) c


theorem s2332f_elements_implies_ontology {w : Elements.Weapon} {c : ComplaintText}
    (h : Elements.ExplosiveOrLethalDevice2332f w c) :
    Ontology.BombingDeviceDefinition (mapDeviceO w) c :=
  match h with
  | .explosive hp   => .explosive (corr2332f_o_explosive hp)
  | .otherLethal hp => .otherLethalDevice (corr2332f_o_otherLethal hp)



axiom corr2332g_item {w : Elements.Weapon} {c : ComplaintText} :
    Elements.CoveredMissileSystem2332g w c →
    Deontic.IsCoveredMissileSystemOrComponent2332g (mapDevice w) c
axiom corr2332g_juris {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332gh p v t c → Deontic.JurisdictionalCircumstance2332gB p c
axiom corr2332g_conduct {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    ActedWithScienter p c →
    Elements.ProducesAcquiresTransfersPossessesOrUsesItem p w c →
    Deontic.KnowinglyDealsInMissileSystem2332gA1 p (mapDevice w) c


axiom corr2332g_nonWeapon {w : Elements.Weapon} {c : ComplaintText} :
    Elements.CoveredMissileSystem2332g w c →
    ¬ Deontic.DeviceNotDesignedOrRedesignedAsWeapon2332gA2 (mapDevice w) c
axiom corr2332g_authority {p : Person} {c : ComplaintText} :
    Deontic.GovernmentAuthorityOrContract2332gA3 p c →
    Elements.ConductUnderUnitedStatesOrStateAuthority p c ∨
    Elements.ConductPursuantToUnitedStatesOrStateContract p c




theorem s2332g_elements_implies_deontic
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (h : Elements.Section2332gMissileOffense p v w t c) :
    Deontic.Violated2332gA1 p (mapDevice w) c :=
  ⟨⟨corr2332g_item h.item, corr2332g_juris h.jurisdiction⟩,
   corr2332g_conduct h.scienter h.conduct,
   corr2332g_nonWeapon h.item,
   fun hA => match corr2332g_authority hA with
     | .inl h1 => h.notGovernmentAuthority h1
     | .inr h2 => h.notGovernmentContract h2⟩

axiom corr2332g_e_violation_remedy {p v : Person} {w : Elements.Weapon}
    {t : Elements.Target} {c : ComplaintText} :
    Elements.Section2332gMissileOffense p v w t c → Remedy.ViolatedSection2332g p c
axiom corr2332g_e_juris_remedy {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332gh p v t c → Remedy.JurisdictionalNexusEstablished p c



axiom corr2332g_r_authority {p : Person} {c : ComplaintText} :
    Remedy.UnitedStatesAuthorityOrContractExclusion p c →
    Elements.ConductUnderUnitedStatesOrStateAuthority p c ∨
    Elements.ConductPursuantToUnitedStatesOrStateContract p c


theorem s2332g_elements_implies_remedy
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (h : Elements.Section2332gMissileOffense p v w t c) : Remedy.CriminalRemedy2332g p c :=
  ⟨corr2332g_e_violation_remedy h, corr2332g_e_juris_remedy h.jurisdiction,
   fun hEx => match corr2332g_r_authority hEx with
     | .inl h1 => h.notGovernmentAuthority h1
     | .inr h2 => h.notGovernmentContract h2⟩

axiom corr2332g_d_violation_remedy {p : Person} {d : Deontic.Device} {c : ComplaintText} :
    Deontic.Violated2332gA1 p d c → Remedy.ViolatedSection2332g p c
axiom corr2332g_d_juris_remedy {p : Person} {c : ComplaintText} :
    Deontic.JurisdictionalCircumstance2332gB p c → Remedy.JurisdictionalNexusEstablished p c
axiom corr2332g_r_authority_deontic {p : Person} {c : ComplaintText} :
    Remedy.UnitedStatesAuthorityOrContractExclusion p c →
    Deontic.GovernmentAuthorityOrContract2332gA3 p c


theorem s2332g_deontic_implies_remedy
    {p : Person} {d : Deontic.Device} {c : ComplaintText}
    (h : Deontic.Violated2332gA1 p d c) : Remedy.CriminalRemedy2332g p c :=
  ⟨corr2332g_d_violation_remedy h, corr2332g_d_juris_remedy h.1.jurisdiction,
   fun hEx => h.2.2.2 (corr2332g_r_authority_deontic hEx)⟩

axiom corr2332g_e_juris_proc {p v : Person} {t : Elements.Target} {c : ComplaintText}
    (o : Procedure.Offense) :
    Elements.Jurisdiction2332gh p v t c → Procedure.Section2332gJurisdictionalCircumstance o c
axiom corr2332g_p_exception {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Procedure.section2332gAuthorizationException o c →
    Elements.ConductUnderUnitedStatesOrStateAuthority p c ∨
    Elements.ConductPursuantToUnitedStatesOrStateContract p c



theorem s2332g_elements_implies_procedure
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (o : Procedure.Offense) (h : Elements.Section2332gMissileOffense p v w t c) :
    Procedure.Section2332gSectionApplies o c :=
  ⟨corr2332g_e_juris_proc o h.jurisdiction,
   fun hEx => match corr2332g_p_exception (p := p) o hEx with
     | .inl h1 => h.notGovernmentAuthority h1
     | .inr h2 => h.notGovernmentContract h2⟩

axiom corr2332g_d_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Deontic.JurisdictionalCircumstance2332gB p c →
    Procedure.Section2332gJurisdictionalCircumstance o c
axiom corr2332g_p_exception_deontic {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332gAuthorizationException o c →
    Deontic.GovernmentAuthorityOrContract2332gA3 p c


theorem s2332g_deontic_implies_procedure
    {p : Person} {d : Deontic.Device} {c : ComplaintText} (o : Procedure.Offense)
    (h : Deontic.Violated2332gA1 p d c) : Procedure.Section2332gSectionApplies o c :=
  ⟨corr2332g_d_juris_proc o h.1.jurisdiction,
   fun hEx => h.2.2.2 (corr2332g_p_exception_deontic o hEx)⟩

axiom corr2332g_r_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Remedy.JurisdictionalNexusEstablished p c →
    Procedure.Section2332gJurisdictionalCircumstance o c
axiom corr2332g_p_exception_remedy {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332gAuthorizationException o c →
    Remedy.UnitedStatesAuthorityOrContractExclusion p c


theorem s2332g_remedy_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Remedy.CriminalRemedy2332g p c) : Procedure.Section2332gSectionApplies o c :=
  ⟨corr2332g_r_juris_proc o h.jurisdiction,
   fun hEx => h.notAuthorized (corr2332g_p_exception_remedy o hEx)⟩









axiom corr2332h_item {w : Elements.Weapon} {c : ComplaintText} :
    Elements.RadiologicalDispersalDevice2332h w c →
    Deontic.IsRadiologicalWeaponOrDevice2332h (mapDevice w) c
axiom corr2332h_juris {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332gh p v t c → Deontic.JurisdictionalCircumstance2332hB p c
axiom corr2332h_conduct {p : Person} {w : Elements.Weapon} {c : ComplaintText} :
    ActedWithScienter p c →
    Elements.ProducesAcquiresTransfersPossessesOrUsesItem p w c →
    Deontic.KnowinglyDealsInRadiologicalDevice2332hA1 p (mapDevice w) c
axiom corr2332h_authority {p : Person} {c : ComplaintText} :
    Deontic.GovernmentAuthorityOrContract2332hA2 p c →
    Elements.ConductUnderUnitedStatesAuthority p c ∨
    Elements.ConductPursuantToUnitedStatesContract p c



theorem s2332h_elements_implies_deontic
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (h : Elements.Section2332hRadiologicalOffense p v w t c) :
    Deontic.Violated2332hA1 p (mapDevice w) c :=
  ⟨⟨corr2332h_item h.item, corr2332h_juris h.jurisdiction⟩,
   corr2332h_conduct h.scienter h.conduct,
   fun hA => match corr2332h_authority hA with
     | .inl h1 => h.notUnitedStatesAuthority h1
     | .inr h2 => h.notUnitedStatesContract h2⟩

axiom corr2332h_e_juris_proc {p v : Person} {t : Elements.Target} {c : ComplaintText}
    (o : Procedure.Offense) :
    Elements.Jurisdiction2332gh p v t c → Procedure.Section2332hJurisdictionalCircumstance o c
axiom corr2332h_p_exception {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Procedure.section2332hAuthorizationException o c →
    Elements.ConductUnderUnitedStatesAuthority p c ∨
    Elements.ConductPursuantToUnitedStatesContract p c



theorem s2332h_elements_implies_procedure
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (o : Procedure.Offense) (h : Elements.Section2332hRadiologicalOffense p v w t c) :
    Procedure.Section2332hSectionApplies o c :=
  ⟨corr2332h_e_juris_proc o h.jurisdiction,
   fun hEx => match corr2332h_p_exception (p := p) o hEx with
     | .inl h1 => h.notUnitedStatesAuthority h1
     | .inr h2 => h.notUnitedStatesContract h2⟩

axiom corr2332h_d_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Deontic.JurisdictionalCircumstance2332hB p c →
    Procedure.Section2332hJurisdictionalCircumstance o c
axiom corr2332h_p_exception_deontic {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332hAuthorizationException o c →
    Deontic.GovernmentAuthorityOrContract2332hA2 p c


theorem s2332h_deontic_implies_procedure
    {p : Person} {d : Deontic.Device} {c : ComplaintText} (o : Procedure.Offense)
    (h : Deontic.Violated2332hA1 p d c) : Procedure.Section2332hSectionApplies o c :=
  ⟨corr2332h_d_juris_proc o h.1.jurisdiction,
   fun hEx => h.2.2 (corr2332h_p_exception_deontic o hEx)⟩

axiom corr2332h_e_violation_remedy {p v : Person} {w : Elements.Weapon}
    {t : Elements.Target} {c : ComplaintText} :
    Elements.Section2332hRadiologicalOffense p v w t c → Remedy.ViolatedSection2332h p c
axiom corr2332h_e_juris_remedy {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332gh p v t c → Remedy.JurisdictionalNexusEstablished p c








theorem s2332h_elements_implies_remedy_modulo_gaps
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText}
    (h : Elements.Section2332hRadiologicalOffense p v w t c)
    (gap_2332h_remedy_exclusion_overbroad :
      ¬ Remedy.UnitedStatesAuthorityOrContractExclusion p c) :
    Remedy.CriminalRemedy2332h p c :=
  ⟨corr2332h_e_violation_remedy h, corr2332h_e_juris_remedy h.jurisdiction,
   gap_2332h_remedy_exclusion_overbroad⟩

axiom corr2332h_d_violation_remedy {p : Person} {d : Deontic.Device} {c : ComplaintText} :
    Deontic.Violated2332hA1 p d c → Remedy.ViolatedSection2332h p c
axiom corr2332h_d_juris_remedy {p : Person} {c : ComplaintText} :
    Deontic.JurisdictionalCircumstance2332hB p c → Remedy.JurisdictionalNexusEstablished p c




theorem s2332h_deontic_implies_remedy_modulo_gaps
    {p : Person} {d : Deontic.Device} {c : ComplaintText}
    (h : Deontic.Violated2332hA1 p d c)
    (gap_2332h_remedy_exclusion_overbroad :
      ¬ Remedy.UnitedStatesAuthorityOrContractExclusion p c) :
    Remedy.CriminalRemedy2332h p c :=
  ⟨corr2332h_d_violation_remedy h, corr2332h_d_juris_remedy h.1.jurisdiction,
   gap_2332h_remedy_exclusion_overbroad⟩

axiom corr2332h_r_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Remedy.JurisdictionalNexusEstablished p c →
    Procedure.Section2332hJurisdictionalCircumstance o c
axiom corr2332h_p_exception_remedy {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332hAuthorizationException o c →
    Remedy.UnitedStatesAuthorityOrContractExclusion p c




theorem s2332h_remedy_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Remedy.CriminalRemedy2332h p c) : Procedure.Section2332hSectionApplies o c :=
  ⟨corr2332h_r_juris_proc o h.jurisdiction,
   fun hEx => h.notAuthorized (corr2332h_p_exception_remedy o hEx)⟩



def Deontic2332iBroken (p : Person) (d : Deontic.Device) (c : ComplaintText) : Prop :=
  Deontic.Violated2332iA1 p d c ∨ Deontic.Violated2332iA2 p c ∨ Deontic.Violated2332iA3 p c

axiom corr2332i_mens {p : Person} {w : Elements.Weapon} {t : Elements.Target}
    {c : ComplaintText} :
    Elements.NuclearAct2332i p w t c → Deontic.HasRequisiteIntentOrKnowledge2332iA1 p c
axiom corr2332i_juris {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332i p v t c → Deontic.JurisdictionalCircumstance2332iB p c
axiom corr2332i_conduct {p : Person} {w : Elements.Weapon} {t : Elements.Target}
    {c : ComplaintText} :
    ActedWithScienter p c → Elements.ActsUnlawfully p c →
    Elements.NuclearAct2332i p w t c →
    Deontic.KnowinglyAndUnlawfullyPossessesOrUsesRadioactiveMaterial2332iA1 p (mapDevice w) c
axiom corr2332i_threat {p : Person} {c : ComplaintText} :
    Elements.ThreatOrDemand2332i p c → Deontic.ThreatensOrDemandsByThreatOrForce2332iA2 p c
axiom corr2332i_threatBelievable {p : Person} {c : ComplaintText} :
    Elements.ThreatOrDemand2332i p c → Deontic.ThreatMayReasonablyBeBelieved2332iA2 p c
axiom corr2332i_inchoate {p : Person} {ag : Agreement} {c : ComplaintText} :
    Elements.Inchoate2332i p ag c → Deontic.AttemptsOrConspires2332iA3 p c
axiom corr2332i_exemption {p : Person} {c : ComplaintText} :
    Deontic.ArmedForcesOrMilitaryActivityExemption2332iD p c →
    Elements.ActivitiesOfArmedForcesDuringArmedConflict c ∨
    Elements.ActivitiesOfMilitaryForcesInOfficialDuties c

theorem notExcluded2332i_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.NotExcluded2332i c) :
    ¬ Deontic.ArmedForcesOrMilitaryActivityExemption2332iD p c :=
  fun hEx => match corr2332i_exemption hEx with
    | .inl h1 => h.notArmedForces h1
    | .inr h2 => h.notMilitaryDuty h2



theorem s2332i_elements_implies_deontic
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section2332iViolation p v w t ag c) :
    Deontic2332iBroken p (mapDevice w) c :=
  match h with
  | .substantive hk =>
      Or.inl ⟨⟨corr2332i_mens hk.act, corr2332i_juris hk.jurisdiction⟩,
              corr2332i_conduct hk.scienter hk.unlawful hk.act,
              notExcluded2332i_elements_implies_deontic hk.notExcluded⟩
  | .threat hk =>
      Or.inr (Or.inl ⟨⟨corr2332i_threatBelievable hk.conduct,
                       corr2332i_juris hk.jurisdiction⟩,
                      corr2332i_threat hk.conduct,
                      notExcluded2332i_elements_implies_deontic hk.notExcluded⟩)
  | .inchoate hk =>
      Or.inr (Or.inr ⟨⟨corr2332i_juris hk.jurisdiction⟩,
                      corr2332i_inchoate hk.inchoate,
                      notExcluded2332i_elements_implies_deontic hk.notExcluded⟩)

axiom corr2332i_e_violation_remedy {p v : Person} {w : Elements.Weapon}
    {t : Elements.Target} {ag : Agreement} {c : ComplaintText} :
    Elements.Section2332iViolation p v w t ag c → Remedy.ViolatedSection2332i p c
axiom corr2332i_e_juris_remedy {p v : Person} {t : Elements.Target} {c : ComplaintText} :
    Elements.Jurisdiction2332i p v t c → Remedy.JurisdictionalNexusEstablished p c
axiom corr2332i_r_armedForces {p : Person} {c : ComplaintText} :
    Remedy.ArmedForcesOrMilitaryForcesExclusion p c →
    Elements.ActivitiesOfArmedForcesDuringArmedConflict c ∨
    Elements.ActivitiesOfMilitaryForcesInOfficialDuties c

theorem parts2332i_of_violation {p v : Person} {w : Elements.Weapon} {t : Elements.Target}
    {ag : Agreement} {c : ComplaintText} (h : Elements.Section2332iViolation p v w t ag c) :
    Elements.Jurisdiction2332i p v t c ∧ Elements.NotExcluded2332i c :=
  match h with
  | .substantive hk => ⟨hk.jurisdiction, hk.notExcluded⟩
  | .threat hk      => ⟨hk.jurisdiction, hk.notExcluded⟩
  | .inchoate hk    => ⟨hk.jurisdiction, hk.notExcluded⟩


theorem s2332i_elements_implies_remedy
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText}
    (h : Elements.Section2332iViolation p v w t ag c) : Remedy.CriminalRemedy2332i p c :=
  ⟨corr2332i_e_violation_remedy h,
   corr2332i_e_juris_remedy (parts2332i_of_violation h).1,
   fun hEx => match corr2332i_r_armedForces hEx with
     | .inl h1 => (parts2332i_of_violation h).2.notArmedForces h1
     | .inr h2 => (parts2332i_of_violation h).2.notMilitaryDuty h2⟩

axiom corr2332i_d_violation_remedy {p : Person} {d : Deontic.Device} {c : ComplaintText} :
    Deontic2332iBroken p d c → Remedy.ViolatedSection2332i p c
axiom corr2332i_d_juris_remedy {p : Person} {c : ComplaintText} :
    Deontic.JurisdictionalCircumstance2332iB p c → Remedy.JurisdictionalNexusEstablished p c
axiom corr2332i_r_armedForces_deontic {p : Person} {c : ComplaintText} :
    Remedy.ArmedForcesOrMilitaryForcesExclusion p c →
    Deontic.ArmedForcesOrMilitaryActivityExemption2332iD p c

theorem parts2332i_of_deontic {p : Person} {d : Deontic.Device} {c : ComplaintText}
    (h : Deontic2332iBroken p d c) :
    Deontic.JurisdictionalCircumstance2332iB p c ∧
    ¬ Deontic.ArmedForcesOrMilitaryActivityExemption2332iD p c :=
  match h with
  | .inl hk              => ⟨hk.1.jurisdiction, hk.2.2⟩
  | .inr (.inl hk)       => ⟨hk.1.jurisdiction, hk.2.2⟩
  | .inr (.inr hk)       => ⟨hk.1.jurisdiction, hk.2.2⟩


theorem s2332i_deontic_implies_remedy
    {p : Person} {d : Deontic.Device} {c : ComplaintText}
    (h : Deontic2332iBroken p d c) : Remedy.CriminalRemedy2332i p c :=
  ⟨corr2332i_d_violation_remedy h,
   corr2332i_d_juris_remedy (parts2332i_of_deontic h).1,
   fun hEx => (parts2332i_of_deontic h).2 (corr2332i_r_armedForces_deontic hEx)⟩

axiom corr2332i_e_juris_proc {p v : Person} {t : Elements.Target} {c : ComplaintText}
    (o : Procedure.Offense) :
    Elements.Jurisdiction2332i p v t c → Procedure.Section2332iJurisdictionalCircumstance o c
axiom corr2332i_p_inapplicable {c : ComplaintText} (o : Procedure.Offense) :
    Procedure.section2332iInapplicable o c →
    Elements.ActivitiesOfArmedForcesDuringArmedConflict c ∨
    Elements.ActivitiesOfMilitaryForcesInOfficialDuties c




theorem s2332i_elements_implies_procedure
    {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
    {c : ComplaintText} (o : Procedure.Offense)
    (h : Elements.Section2332iViolation p v w t ag c) :
    Procedure.Section2332iSectionApplies o c :=
  ⟨corr2332i_e_juris_proc o (parts2332i_of_violation h).1,
   fun hBar => match corr2332i_p_inapplicable o hBar with
     | .inl h1 => (parts2332i_of_violation h).2.notArmedForces h1
     | .inr h2 => (parts2332i_of_violation h).2.notMilitaryDuty h2⟩

axiom corr2332i_d_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Deontic.JurisdictionalCircumstance2332iB p c →
    Procedure.Section2332iJurisdictionalCircumstance o c
axiom corr2332i_p_inapplicable_deontic {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332iInapplicable o c →
    Deontic.ArmedForcesOrMilitaryActivityExemption2332iD p c


theorem s2332i_deontic_implies_procedure
    {p : Person} {d : Deontic.Device} {c : ComplaintText} (o : Procedure.Offense)
    (h : Deontic2332iBroken p d c) : Procedure.Section2332iSectionApplies o c :=
  ⟨corr2332i_d_juris_proc o (parts2332i_of_deontic h).1,
   fun hBar => (parts2332i_of_deontic h).2 (corr2332i_p_inapplicable_deontic o hBar)⟩

axiom corr2332i_r_juris_proc {p : Person} {c : ComplaintText} (o : Procedure.Offense) :
    Remedy.JurisdictionalNexusEstablished p c →
    Procedure.Section2332iJurisdictionalCircumstance o c
axiom corr2332i_p_inapplicable_remedy {p : Person} {c : ComplaintText}
    (o : Procedure.Offense) :
    Procedure.section2332iInapplicable o c → Remedy.ArmedForcesOrMilitaryForcesExclusion p c


theorem s2332i_remedy_implies_procedure
    {p : Person} {c : ComplaintText} (o : Procedure.Offense)
    (h : Remedy.CriminalRemedy2332i p c) : Procedure.Section2332iSectionApplies o c :=
  ⟨corr2332i_r_juris_proc o h.jurisdiction,
   fun hBar => h.notArmedConflict (corr2332i_p_inapplicable_remedy o hBar)⟩



axiom corr2333_terrorism {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.InternationalTerrorism2331 a c →
    Deontic.IsActOfInternationalTerrorism2331 (mapActD a) c
axiom corr2333_injury {p : Person} {a : Elements.TerroristAct} {inj : Elements.Injury}
    {c : ComplaintText} :
    Elements.InjuredInPersonPropertyOrBusiness p inj c → ProximateCause p c →
    Deontic.InjuredByReasonOfActOfInternationalTerrorism2333A p (mapActD a) c


theorem s2333_elements_implies_deontic
    {p v : Person} {a : Elements.TerroristAct} {inj : Elements.Injury} {c : ComplaintText}
    (h : Elements.Section2333PrimaryClaim p v a inj c)
    (hNat : Elements.IsNationalOfUnitedStates p c) :
    Deontic.Permission2333A p (mapActD a) c :=
  ⟨corr2332a_national hNat, corr2333_terrorism h.terrorism,
   corr2333_injury (a := a) h.injury h.causation⟩









theorem s2333_elements_implies_deontic_modulo_gaps
    {p v : Person} {a : Elements.TerroristAct} {inj : Elements.Injury} {c : ComplaintText}
    (h : Elements.Section2333PrimaryClaim p v a inj c)
    (gap_2333_derivative_plaintiff_not_in_addressee_class :
      Deontic.IsNationalOfUnitedStates p c) :
    Deontic.Permission2333A p (mapActD a) c :=
  ⟨gap_2333_derivative_plaintiff_not_in_addressee_class,
   corr2333_terrorism h.terrorism,
   corr2333_injury (a := a) h.injury h.causation⟩

axiom corr2333_e_privateRight {p : Person} {c : ComplaintText} :
    Elements.BroughtInAppropriateDistrictCourt c → Remedy.HasPrivateRightOfAction p c
axiom corr2333_e_national {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c → Remedy.IsNationalOfTheUnitedStates p c
axiom corr2333_e_injury {p : Person} {inj : Elements.Injury} {c : ComplaintText} :
    Elements.InjuredInPersonPropertyOrBusiness p inj c → Remedy.InjuryCognizable p c
axiom corr2333_e_predicate {a : Elements.TerroristAct} {c : ComplaintText} :
    Elements.InternationalTerrorism2331 a c → Remedy.IsActOfInternationalTerrorism c
axiom corr2333_e_causation {p : Person} {c : ComplaintText} :
    ProximateCause p c → Remedy.CausedByViolation p c
axiom corr2333_e_heir {p v : Person} {c : ComplaintText} :
    Elements.IsEstateSurvivorOrHeirOfInjuredNational p v c → Remedy.IsEstateSurvivorOrHeir p v c
axiom corr2333_e_defendantLiable {p : Person} {a : Elements.TerroristAct}
    {c : ComplaintText} :
    Elements.InternationalTerrorism2331 a c → Remedy.CommittedActOfInternationalTerrorism p c




axiom corr2333_e_derivative {p v : Person} {inj : Elements.Injury} {c : ComplaintText} :
    Elements.IsEstateSurvivorOrHeirOfInjuredNational p v c →
    Elements.InjuredInPersonPropertyOrBusiness p inj c → ProximateCause p c →
    Remedy.HasPrivateRightOfAction v c ∧ Remedy.InjuryCognizable v c ∧
    Remedy.CausedByViolation v c





theorem s2333_elements_implies_remedy
    {p v d : Person} {a : Elements.TerroristAct} {inj : Elements.Injury}
    {c : ComplaintText}
    (h : Elements.Section2333PrimaryClaim p v a inj c) :
    Remedy.RemedyAvailable2333a p d c :=
  ⟨match h.plaintiff with
   | .national hNat =>
       .direct ⟨corr2333_e_privateRight h.forum, corr2333_e_national hNat,
                corr2333_e_injury h.injury, corr2333_e_predicate h.terrorism,
                corr2333_e_causation h.causation⟩
   | .representative hRel hvNat =>
       .derivative v ⟨⟨(corr2333_e_derivative hRel h.injury h.causation).1,
                       corr2333_e_national hvNat,
                       (corr2333_e_derivative hRel h.injury h.causation).2.1,
                       corr2333_e_predicate h.terrorism,
                       (corr2333_e_derivative hRel h.injury h.causation).2.2⟩,
                      corr2333_e_heir hRel⟩,
   .primary (corr2333_e_defendantLiable (p := d) h.terrorism)⟩

axiom corr2333_d_privateRight {p : Person} {c : ComplaintText} :
    Deontic.IsNationalOfUnitedStates p c → Remedy.HasPrivateRightOfAction p c
axiom corr2333_d_national {p : Person} {c : ComplaintText} :
    Deontic.IsNationalOfUnitedStates p c → Remedy.IsNationalOfTheUnitedStates p c
axiom corr2333_d_injury {p : Person} {a : Deontic.TerroristAct} {c : ComplaintText} :
    Deontic.InjuredByReasonOfActOfInternationalTerrorism2333A p a c →
    Remedy.InjuryCognizable p c ∧ Remedy.CausedByViolation p c
axiom corr2333_d_predicate {a : Deontic.TerroristAct} {c : ComplaintText} :
    Deontic.IsActOfInternationalTerrorism2331 a c → Remedy.IsActOfInternationalTerrorism c
axiom corr2333_d_defendantLiable {p : Person} {a : Deontic.TerroristAct}
    {c : ComplaintText} :
    Deontic.IsActOfInternationalTerrorism2331 a c →
    Remedy.CommittedActOfInternationalTerrorism p c



theorem s2333_deontic_implies_remedy
    {p d : Person} {a : Deontic.TerroristAct} {c : ComplaintText}
    (h : Deontic.Permission2333A p a c) : Remedy.RemedyAvailable2333a p d c :=
  ⟨.direct ⟨corr2333_d_privateRight h.addressee, corr2333_d_national h.addressee,
            (corr2333_d_injury h.injury).1, corr2333_d_predicate h.terrorism,
            (corr2333_d_injury h.injury).2⟩,
   .primary (corr2333_d_defendantLiable (p := d) h.terrorism)⟩

axiom corr2333_e_national_proc {p : Person} {c : ComplaintText} :
    Elements.IsNationalOfUnitedStates p c → Procedure.IsNationalOfTheUnitedStates p c
axiom corr2333_e_accrued_proc {p : Person} {inj : Elements.Injury} {c : ComplaintText} :
    Elements.InjuredInPersonPropertyOrBusiness p inj c → ProximateCause p c →
    Procedure.Section2333ClaimAccrued p c
axiom corr2333_e_heir_proc {p v : Person} {c : ComplaintText} :
    Elements.IsEstateSurvivorOrHeirOfInjuredNational p v c →
    Procedure.IsEstateSurvivorOrHeirOfInjuredNational p c
axiom corr2333_e_forum_proc {c : ComplaintText} (a : Procedure.CivilAction) :
    Elements.BroughtInAppropriateDistrictCourt c →
    Procedure.FiledInAppropriateDistrictCourt a c




theorem s2333_elements_implies_procedure
    {p v : Person} {a : Elements.TerroristAct} {inj : Elements.Injury}
    {c : ComplaintText} (act : Procedure.CivilAction)
    (h : Elements.Section2333PrimaryClaim p v a inj c)
    (procStep_commenced : Procedure.CivilActionCommenced act p c) :
    Procedure.Section2333ActionProperlyCommenced p act c :=
  ⟨match h.plaintiff with
   | .national hNat =>
       .asInjuredNational (corr2333_e_national_proc hNat)
         (corr2333_e_accrued_proc h.injury h.causation)
   | .representative hRel _ => .asEstateSurvivorOrHeir (corr2333_e_heir_proc hRel),
   procStep_commenced,
   corr2333_e_forum_proc act h.forum⟩

axiom corr2333_d_national_proc {p : Person} {c : ComplaintText} :
    Deontic.IsNationalOfUnitedStates p c → Procedure.IsNationalOfTheUnitedStates p c
axiom corr2333_d_accrued_proc {p : Person} {a : Deontic.TerroristAct} {c : ComplaintText} :
    Deontic.InjuredByReasonOfActOfInternationalTerrorism2333A p a c →
    Procedure.Section2333ClaimAccrued p c
axiom corr2333_d_forum_proc {p : Person} {pr : Deontic.Proceeding} {c : ComplaintText}
    (act : Procedure.CivilAction) :
    Deontic.SuesInDistrictCourt2333A p pr c → Procedure.FiledInAppropriateDistrictCourt act c




theorem s2333_deontic_implies_procedure
    {p : Person} {a : Deontic.TerroristAct} {pr : Deontic.Proceeding} {c : ComplaintText}
    (act : Procedure.CivilAction)
    (h : Deontic.Permission2333A p a c)
    (peer_sues : Deontic.SuesInDistrictCourt2333A p pr c)
    (procStep_commenced : Procedure.CivilActionCommenced act p c) :
    Procedure.Section2333ActionProperlyCommenced p act c :=
  ⟨.asInjuredNational (corr2333_d_national_proc h.addressee)
     (corr2333_d_accrued_proc h.injury),
   procStep_commenced,
   corr2333_d_forum_proc act peer_sues⟩

axiom corr2333_r_national_proc {p : Person} {c : ComplaintText} :
    Remedy.IsNationalOfTheUnitedStates p c → Procedure.IsNationalOfTheUnitedStates p c
axiom corr2333_r_accrued_proc {p : Person} {c : ComplaintText} :
    Remedy.InjuryCognizable p c → Remedy.CausedByViolation p c →
    Procedure.Section2333ClaimAccrued p c
axiom corr2333_r_heir_proc {p q : Person} {c : ComplaintText} :
    Remedy.IsEstateSurvivorOrHeir p q c →
    Procedure.IsEstateSurvivorOrHeirOfInjuredNational p c
axiom corr2333_r_forum_proc {p : Person} {c : ComplaintText} (a : Procedure.CivilAction) :
    Remedy.Claimant2333a p c → Procedure.FiledInAppropriateDistrictCourt a c



theorem s2333_remedy_implies_procedure
    {p d : Person} {c : ComplaintText} (act : Procedure.CivilAction)
    (h : Remedy.RemedyAvailable2333a p d c)
    (procStep_commenced : Procedure.CivilActionCommenced act p c) :
    Procedure.Section2333ActionProperlyCommenced p act c :=
  ⟨match h.claimant with
   | .direct hs =>
       .asInjuredNational (corr2333_r_national_proc hs.claimantClass)
         (corr2333_r_accrued_proc hs.injury hs.causation)
   | .derivative _ hd => .asEstateSurvivorOrHeir (corr2333_r_heir_proc hd.relationship),
   procStep_commenced,
   corr2333_r_forum_proc act h.claimant⟩

axiom corr2333_o_assetOfParty {p : Person} {c : ComplaintText} (as_ : Ontology.Asset) :
    Elements.JudgmentObtainedAgainstTerroristParty p c →
    Ontology.IsAssetOfTerroristParty as_ p c ∧ Ontology.IsTerroristParty p c
axiom corr2333_o_seized {c : ComplaintText} (as_ : Ontology.Asset) :
    Elements.AssetSeizedOrFrozenUnderKingpinAct c →
    Ontology.SeizedOrFrozenUnderKingpinAct as_ c




theorem s2333_elements_implies_ontology {p : Person} {c : ComplaintText}
    (as_ : Ontology.Asset) (h : Elements.Section2333eBlockedAsset p c) :
    Ontology.BlockedAssetInclusion as_ p c :=
  ⟨(corr2333_o_assetOfParty as_ h.judgment).1,
   (corr2333_o_assetOfParty as_ h.judgment).2,
   corr2333_o_seized as_ h.asset⟩










axiom corr2332e_requester {rq : Elements.AssistanceRequest} {c : ComplaintText}
    (r : Procedure.AssistanceRequest) :
    Elements.RequestMadeByAttorneyGeneralOrAuthorizedDelegate rq c →
    Procedure.RequestMadeByAttorneyGeneral r c ∨
    Procedure.RequestMadeByDelegatedJusticeOfficial r c
axiom corr2332e_purpose {rq : Elements.AssistanceRequest} {c : ComplaintText}
    (r : Procedure.AssistanceRequest) :
    Elements.RequestSupportsEnforcementOfSection2332a rq c →
    Procedure.RequestSupportsSection2332aEnforcement r c
axiom corr2332e_emergency {rq : Elements.AssistanceRequest} {c : ComplaintText} :
    Elements.EmergencySituationInvolvingWeaponOfMassDestruction rq c →
    Procedure.EmergencySituationInvolvingWeaponOfMassDestruction c



theorem s2332e_elements_implies_procedure
    {rq : Elements.AssistanceRequest} {c : ComplaintText}
    (r : Procedure.AssistanceRequest)
    (h : Elements.Section2332eAssistanceRequest rq c) :
    Procedure.Section2332eValidAssistanceRequest r c :=
  ⟨corr2332e_requester r h.requester, corr2332e_purpose r h.purpose,
   corr2332e_emergency h.emergency⟩

axiom corr2332e_emergency_remedy {rq : Elements.AssistanceRequest} {c : ComplaintText} :
    Elements.EmergencySituationInvolvingWeaponOfMassDestruction rq c →
    Remedy.EmergencyInvolvingWeaponOfMassDestruction c
axiom corr2332e_requested_remedy {rq : Elements.AssistanceRequest} {c : ComplaintText} :
    Elements.RequestMadeByAttorneyGeneralOrAuthorizedDelegate rq c →
    Elements.RequestSupportsEnforcementOfSection2332a rq c →
    Remedy.MilitaryAssistanceRequestedByAttorneyGeneral c


theorem s2332e_elements_implies_remedy
    {rq : Elements.AssistanceRequest} {c : ComplaintText}
    (h : Elements.Section2332eAssistanceRequest rq c) : Remedy.MilitaryAssistance2332e c :=
  ⟨corr2332e_emergency_remedy h.emergency,
   corr2332e_requested_remedy h.requester h.purpose⟩

axiom corr2332e_ag_deontic {o : Deontic.Official} {c : ComplaintText}
    {rq : Elements.AssistanceRequest} :
    Elements.EmergencySituationInvolvingWeaponOfMassDestruction rq c →
    Elements.RequestSupportsEnforcementOfSection2332a rq c →
    Deontic.EmergencyInvolvingWeaponOfMassDestruction2332e c ∧
    Deontic.SupportsEnforcementOfSection2332a c




theorem s2332e_elements_implies_deontic
    {rq : Elements.AssistanceRequest} {o : Deontic.Official} {c : ComplaintText}
    (h : Elements.Section2332eAssistanceRequest rq c)
    (peer_isAG : Deontic.IsAttorneyGeneral o c) : Deontic.Power2332e o c :=
  ⟨peer_isAG,
   (corr2332e_ag_deontic (o := o) h.emergency h.purpose).1,
   (corr2332e_ag_deontic (o := o) h.emergency h.purpose).2⟩






def s2332_tierA_pairwise : Prop :=
  (∀ {p v : Person} {ag : Agreement} {c : ComplaintText},
      Elements.Section2332Violation p v ag c → Deontic2332Broken p c)
  ∧ (∀ {p v : Person} {ag : Agreement} {c : ComplaintText},
      Elements.Section2332Violation p v ag c → Remedy.CriminalRemedy2332 p c)
  ∧ (∀ {pr : Procedure.Prosecution} {cert : Procedure.Certification} {c : ComplaintText},
      Procedure.Section2332ProsecutionAuthorized pr cert c →
      ¬ Deontic.Violated2332D (mapProceeding pr) c)

theorem s2332_tierA : s2332_tierA_pairwise :=
  ⟨fun h => s2332_elements_implies_deontic h,
   fun h => s2332_elements_implies_remedy h,
   fun h => s2332_procedure_implies_deontic h⟩

def s2332a_tierA_pairwise : Prop :=
  (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
      {c : ComplaintText},
      Elements.Section2332aViolation p v w t ag c → Deontic2332aBroken p (mapDevice w) c)
  ∧ (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
      {c : ComplaintText},
      Elements.Section2332aViolation p v w t ag c → Remedy.CriminalRemedy2332a p c)
  ∧ (∀ {p : Person} {d : Deontic.Device} {c : ComplaintText},
      Deontic2332aBroken p d c → Remedy.CriminalRemedy2332a p c)

theorem s2332a_tierA : s2332a_tierA_pairwise :=
  ⟨fun h => s2332a_elements_implies_deontic h,
   fun h => s2332a_elements_implies_remedy h,
   fun h => s2332a_deontic_implies_remedy h⟩

def s2332b_tierA_pairwise : Prop :=
  (∀ {p v : Person} {t : Elements.Target} {ag : Agreement} {c : ComplaintText},
      Elements.Section2332bViolation p v t ag c → Deontic2332bBroken p c)
  ∧ (∀ {p v : Person} {t : Elements.Target} {ag : Agreement} {c : ComplaintText},
      Elements.Section2332bViolation p v t ag c → Remedy.CriminalRemedy2332b p c)
  ∧ (∀ {p : Person} {c : ComplaintText}, Deontic2332bBroken p c → Remedy.CriminalRemedy2332b p c)

theorem s2332b_tierA : s2332b_tierA_pairwise :=
  ⟨fun h => s2332b_elements_implies_deontic h,
   fun h => s2332b_elements_implies_remedy h,
   fun h => s2332b_deontic_implies_remedy h⟩

def s2332d_tierA_pairwise : Prop :=
  (∀ {p : Person} {k : Elements.Country} {tx : Elements.Transaction} {c : ComplaintText},
      Elements.Section2332dFinancialTransaction p k tx c →
      Deontic.Violated2332d p (mapTxD tx) (mapCountryD k) c)
  ∧ (∀ {p : Person} {k : Elements.Country} {tx : Elements.Transaction} {c : ComplaintText},
      Elements.Section2332dFinancialTransaction p k tx c → Remedy.CriminalRemedy2332d p c)
  ∧ (∀ {p : Person} {t : Deontic.Transaction} {k : Deontic.Country} {c : ComplaintText},
      Deontic.Violated2332d p t k c → Remedy.CriminalRemedy2332d p c)

theorem s2332d_tierA : s2332d_tierA_pairwise :=
  ⟨fun h => s2332d_elements_implies_deontic h,
   fun h => s2332d_elements_implies_remedy h,
   fun h => s2332d_deontic_implies_remedy h⟩

def s2332f_tierA_pairwise : Prop :=
  (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
      {c : ComplaintText},
      Elements.Section2332fViolation p v w t ag c →
      Deontic2332fBroken p (mapDevice w) (mapFacility t) c)
  ∧ (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
      {c : ComplaintText},
      Elements.Section2332fViolation p v w t ag c → Remedy.CriminalRemedy2332f p c)
  ∧ (∀ {p : Person} {d : Deontic.Device} {f : Deontic.Facility} {c : ComplaintText},
      Deontic2332fBroken p d f c → Remedy.CriminalRemedy2332f p c)

theorem s2332f_tierA : s2332f_tierA_pairwise :=
  ⟨fun h => s2332f_elements_implies_deontic h,
   fun h => s2332f_elements_implies_remedy h,
   fun h => s2332f_deontic_implies_remedy h⟩

def s2332g_tierA_pairwise : Prop :=
  (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText},
      Elements.Section2332gMissileOffense p v w t c → Deontic.Violated2332gA1 p (mapDevice w) c)
  ∧ (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {c : ComplaintText},
      Elements.Section2332gMissileOffense p v w t c → Remedy.CriminalRemedy2332g p c)
  ∧ (∀ {p : Person} {d : Deontic.Device} {c : ComplaintText},
      Deontic.Violated2332gA1 p d c → Remedy.CriminalRemedy2332g p c)

theorem s2332g_tierA : s2332g_tierA_pairwise :=
  ⟨fun h => s2332g_elements_implies_deontic h,
   fun h => s2332g_elements_implies_remedy h,
   fun h => s2332g_deontic_implies_remedy h⟩

def s2332i_tierA_pairwise : Prop :=
  (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
      {c : ComplaintText},
      Elements.Section2332iViolation p v w t ag c → Deontic2332iBroken p (mapDevice w) c)
  ∧ (∀ {p v : Person} {w : Elements.Weapon} {t : Elements.Target} {ag : Agreement}
      {c : ComplaintText},
      Elements.Section2332iViolation p v w t ag c → Remedy.CriminalRemedy2332i p c)
  ∧ (∀ {p : Person} {d : Deontic.Device} {c : ComplaintText},
      Deontic2332iBroken p d c → Remedy.CriminalRemedy2332i p c)

theorem s2332i_tierA : s2332i_tierA_pairwise :=
  ⟨fun h => s2332i_elements_implies_deontic h,
   fun h => s2332i_elements_implies_remedy h,
   fun h => s2332i_deontic_implies_remedy h⟩

end Proving.USC.T18.Ch113B.Bridge
