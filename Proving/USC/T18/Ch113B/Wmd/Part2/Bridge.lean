



































import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Statute
import Proving.USC.T18.Ch113B.Wmd.Part2.Deontic.Statute
import Proving.USC.T18.Ch113B.Wmd.Part2.Ontology.Statute
import Proving.USC.T18.Ch113B.Wmd.Part2.Procedure.Statute
import Proving.USC.T18.Ch113B.Wmd.Part2.Structure.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.Bridge

open Proving.USC.Common



namespace ED





axiom edOffense : Elements.Offense → Deontic.Offense
axiom edConduct : Elements.Offense → Deontic.Conduct
axiom edProperty : Elements.Property → Deontic.Property



axiom corr_outside {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurringOutsideTheUnitedStates o c →
    Deontic.ConductOccurredOutsideUnitedStates (edConduct o) c

axiom corr_within {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurringWithinTheUnitedStates o c →
    Deontic.ConductOccurredInUnitedStates (edConduct o) c



theorem s2332b_g1_elements_implies_deontic
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.ConductTranscendingNationalBoundaries o c) :
    Deontic.TranscendsNationalBoundaries (edConduct o) c :=
  ⟨corr_within h.domestic, corr_outside h.abroad⟩










axiom corr_facility {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfCommerceUsedInFurtherance o c →
    Deontic.MailOrFacilityOfInterstateCommerceUsedInFurtherance (edConduct o) c

axiom corr_commerceActual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateOrForeignCommerce o c →
    Deontic.OffenseObstructsDelaysOrAffectsInterstateCommerce (edConduct o) c

axiom corr_commerceCounterfactual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseWouldHaveAffectedCommerceIfConsummated o c →
    Deontic.OffenseWouldHaveAffectedInterstateCommerceIfConsummated (edConduct o) c

axiom corr_federalVictim {v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrFederalPersonnel v o c →
    Deontic.VictimNexusB1C (edConduct o) c

axiom corr_federalProperty {pr : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOwnedPossessedOrLeasedToTheUnitedStates pr c →
    Deontic.PropertyOwnedPossessedOrLeasedByUnitedStates (edProperty pr) c

axiom corr_territorialSea {o : Elements.Offense} {c : ComplaintText} :
    Elements.TerritorialSeaOfTheUnitedStates o c →
    Deontic.OffenseCommittedInTerritorialSeaOfUnitedStates (edConduct o) c

axiom corr_smtj {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    Deontic.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction (edConduct o) c



theorem s2332b_b1_elements_implies_deontic
    {o : Elements.Offense} {v : Person} {pr : Elements.Property} {c : ComplaintText}
    (h : Elements.CircumstanceUnderSubsectionB o v pr c) :
    Deontic.SubsectionBCircumstance (edProperty pr) (edConduct o) c :=
  match h with
  | .facilityOfCommerce hf => .mailOrCommerceFacility (corr_facility hf)
  | .commerceEffect he =>
      .commerceEffect
        (match he with
          | .actual ha => .actualEffect (corr_commerceActual ha)
          | .ifConsummated hb => .ifConsummated (corr_commerceCounterfactual hb))
  | .federalVictim hv => .victimClass (corr_federalVictim hv)
  | .federalProperty hp => .federalProperty (corr_federalProperty hp)
  | .territorialSea ht => .territorialSea (corr_territorialSea ht)
  | .specialMaritime hs => .specialMaritimeAndTerritorialJurisdiction (corr_smtj hs)



axiom corr_kills {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.KillsPerson p o v c → Deontic.KilledVictim p v (edConduct o) c

axiom corr_kidnaps {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.KidnapsPerson p o v c → Deontic.KidnappedVictim p v (edConduct o) c

axiom corr_maims {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.MaimsPerson p o v c → Deontic.MaimedVictim p v (edConduct o) c

axiom corr_assaultSbi {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.CommitsAssaultResultingInSeriousBodilyInjury p o v c →
    Deontic.CommittedAssaultResultingInSeriousBodilyInjury p v (edConduct o) c

axiom corr_assaultDw {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.AssaultsWithADangerousWeapon p o v c →
    Deontic.AssaultedWithDangerousWeapon p v (edConduct o) c

axiom corr_victimLocus {v : Person} {c : ComplaintText} :
    IsPersonInUS v c → Deontic.VictimIsPersonWithinUnitedStates v c

axiom corr_risk {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.CreatesSubstantialRiskOfSeriousBodilyInjury p o c →
    Deontic.CreatedSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson p (edConduct o) c

axiom corr_destroys {p : Person} {o : Elements.Offense} {pr : Elements.Property}
    {c : ComplaintText} :
    Elements.DestroysOrDamagesProperty p o pr c →
    Deontic.DestroyedOrDamagedProperty p (edProperty pr) (edConduct o) c

axiom corr_attemptsProperty {p : Person} {o : Elements.Offense} {pr : Elements.Property}
    {c : ComplaintText} :
    Elements.AttemptsOrConspiresToDestroyOrDamageProperty p o pr c →
    Deontic.AttemptedOrConspiredToDestroyOrDamageProperty p (edProperty pr) (edConduct o) c

axiom corr_propertyLocus {pr : Elements.Property} {c : ComplaintText} :
    Elements.PropertyIsWithinTheUnitedStates pr c →
    Deontic.PropertyIsWithinUnitedStates (edProperty pr) c




theorem s2332b_a1_conduct_elements_implies_deontic
    {p : Person} {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (h : Elements.ProhibitedConductUnderParagraph1 p o v pr c) :
    Deontic.ProscribedConduct2332bA1 p v (edProperty pr) (edConduct o) c :=
  match h with
  | .violentAct hv =>
      .againstPerson
        ⟨(match hv.act with
            | .kills hk => .killing (corr_kills hk)
            | .kidnaps hk => .kidnapping (corr_kidnaps hk)
            | .maims hm => .maiming (corr_maims hm)
            | .assaultSeriousInjury ha => .assaultSeriousBodilyInjury (corr_assaultSbi ha)
            | .assaultDangerousWeapon ha => .assaultDangerousWeapon (corr_assaultDw ha)),
         corr_victimLocus hv.victimWithinTheUS⟩
  | .propertyRisk hp =>
      .againstProperty
        ⟨corr_risk hp.risk,
         (match hp.means with
            | .destroysOrDamages hd => .destroyedOrDamaged (corr_destroys hd)
            | .attemptsOrConspires ha => .attemptedOrConspired (corr_attemptsProperty ha)),
         corr_propertyLocus hp.propertyWithinTheUS⟩



axiom corr_stateLaw {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfAnyState p o c → Deontic.ViolatesLawOfAState p (edConduct o) c

axiom corr_federalLaw {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfTheUnitedStates p o c →
    Deontic.ViolatesLawOfTheUnitedStates p (edConduct o) c

theorem s2332b_a1_unlawful_elements_implies_deontic
    {p : Person} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.InViolationOfStateOrFederalLaw p o c) :
    Deontic.PredicateLawViolated p (edConduct o) c :=
  match h with
  | .stateLaw hs => .stateLaw (corr_stateLaw hs)
  | .federalLaw hf => .federalLaw (corr_federalLaw hf)











axiom corr_addressee {p : Person} {o : Elements.Offense} {v : Person}
    {pr : Elements.Property} {c : ComplaintText} :
    Elements.ProhibitedConductUnderParagraph1 p o v pr c → Deontic.AddresseeAnyPerson p c

theorem s2332b_a1_elements_implies_deontic
    {p : Person} {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (h : Elements.Section2332bA1 p o v pr c) :
    Deontic.Prohibition2332bA1Violated p v (edProperty pr) (edConduct o) c :=
  ⟨⟨corr_addressee h.prohibitedConduct,
    s2332b_g1_elements_implies_deontic h.transnational,
    s2332b_b1_elements_implies_deontic h.circumstance,
    s2332b_a1_unlawful_elements_implies_deontic h.unlawful⟩,
   s2332b_a1_conduct_elements_implies_deontic h.prohibitedConduct⟩



















axiom corr_constitutedBy {p : Person} {o : Elements.Offense} {v : Person}
    {pr : Elements.Property} {c : ComplaintText} :
    Elements.Section2332bA1 p o v pr c →
    Deontic.OffenseWouldBeConstitutedByConduct (edOffense o) (edConduct o) c

axiom corr_threat {p : Person} {o obj : Elements.Offense} {c : ComplaintText} :
    Elements.ThreatRoute p o obj c → Deontic.ThreatenedToCommitOffense p (edOffense obj) c

axiom corr_attempt {p : Person} {o obj : Elements.Offense} {c : ComplaintText} :
    Elements.AttemptRoute p o obj c → Deontic.AttemptedToCommitOffense p (edOffense obj) c

axiom corr_conspiracy {p : Person} {o obj : Elements.Offense} {ag : Agreement}
    {c : ComplaintText} :
    Elements.InchoateModalityUnderParagraph2 p o obj ag c →
    Elements.ConspiracyRoute p obj ag c →
    Deontic.ConspiredToCommitOffense p (edOffense obj) c


theorem s2332b_a2_objectOffense_elements_implies_deontic
    {p : Person} {obj : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (h : Elements.Section2332bA1 p obj v pr c) :
    Deontic.ObjectOffenseUnderParagraph1 p v (edProperty pr) (edOffense obj) (edConduct obj) c :=
  ⟨corr_constitutedBy h,
   s2332b_g1_elements_implies_deontic h.transnational,
   s2332b_b1_elements_implies_deontic h.circumstance,
   s2332b_a1_conduct_elements_implies_deontic h.prohibitedConduct,
   s2332b_a1_unlawful_elements_implies_deontic h.unlawful⟩

theorem s2332b_a2_elements_implies_deontic
    {p : Person} {o obj : Elements.Offense} {v : Person} {pr : Elements.Property}
    {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332bA2 p o obj v pr ag c) :
    Deontic.Prohibition2332bA2Violated p p v (edProperty pr) (edOffense obj) (edConduct obj) c :=
  ⟨⟨corr_addressee h.objectOffense.prohibitedConduct,
    s2332b_a2_objectOffense_elements_implies_deontic h.objectOffense⟩,
   (match h.modality with
      | .threat ht => .threat (corr_threat ht)
      | .attempt ha => .attempt (corr_attempt ha)
      | .conspiracy hc => .conspiracy (corr_conspiracy h.modality hc))⟩



axiom corr_motiveInfluence {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceGovernmentByIntimidationOrCoercion o c →
    Deontic.CalculatedToInfluenceOrAffectGovernmentConductByIntimidationOrCoercion (edOffense o) c

axiom corr_motiveRetaliate {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToRetaliateAgainstGovernmentConduct o c →
    Deontic.CalculatedToRetaliateAgainstGovernmentConduct (edOffense o) c

axiom corr_title18 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle18Provision o c →
    Deontic.ViolatesEnumeratedTitle18TerrorismProvision (edOffense o) c

axiom corr_aea {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedAtomicEnergyActProvision o c →
    Deontic.ViolatesEnumeratedAtomicEnergyActProvision (edOffense o) c

axiom corr_title49 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle49Provision o c →
    Deontic.ViolatesEnumeratedTitle49Provision (edOffense o) c

axiom corr_narco {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesSection1010ANarcoTerrorism o c →
    Deontic.ViolatesNarcoTerrorismProvision (edOffense o) c



theorem s2332b_g5_elements_implies_deontic
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism o c) :
    Deontic.FederalCrimeOfTerrorism (edOffense o) c :=
  ⟨(match h.motive with
      | .influenceGovernment hi => .influenceOrAffect (corr_motiveInfluence hi)
      | .retaliate hr => .retaliate (corr_motiveRetaliate hr)),
   (match h.enumeratedOffense with
      | .title18 h18 => .title18 (corr_title18 h18)
      | .atomicEnergyAct ha => .atomicEnergyAct (corr_aea ha)
      | .title49 h49 => .title49 (corr_title49 h49)
      | .narcoTerrorism hn => .narcoTerrorism (corr_narco hn))⟩

end ED



namespace EO

axiom eoOffense : Elements.Offense → Ontology.Offense
axiom eoConduct : Elements.Offense → Ontology.Conduct
axiom eoProperty : Elements.Property → Ontology.PropertyObject
axiom eoCircumstance : Elements.Offense → Ontology.Circumstance
axiom eoLaw : Elements.Offense → Ontology.LawProvision
axiom eoFacility : Elements.Offense → Ontology.Facility
axiom eoLocale : Elements.Offense → Ontology.Locale
axiom eoEntity : Elements.Property → Entity
axiom eoInjury : Elements.Offense → Ontology.Injury
axiom eoRiskVictim : Elements.Offense → Person



axiom corr_within {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurringWithinTheUnitedStates o c →
    Ontology.OccursWithinTheUnitedStates (eoConduct o) c

axiom corr_outside {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurringOutsideTheUnitedStates o c →
    Ontology.OccursOutsideTheUnitedStates (eoConduct o) c

theorem s2332b_g1_elements_implies_ontology
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.ConductTranscendingNationalBoundaries o c) :
    Ontology.ConductTranscendingNationalBoundaries (eoConduct o) c :=
  ⟨corr_within h.domestic, corr_outside h.abroad⟩








axiom corr_attaches {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText} :
    Elements.CircumstanceUnderSubsectionB o v pr c →
    Ontology.IsTheCircumstanceOfOffense (eoCircumstance o) (eoOffense o) c

axiom corr_facility {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfCommerceUsedInFurtherance o c →
    Ontology.MailOrCommerceFacilityUseInFurtherance (eoFacility o) (eoOffense o) c

axiom corr_commerceActual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateOrForeignCommerce o c →
    Ontology.ObstructsDelaysOrAffectsInterstateOrForeignCommerce (eoOffense o) c

axiom corr_commerceCounterfactual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseWouldHaveAffectedCommerceIfConsummated o c →
    Ontology.WouldHaveAffectedInterstateOrForeignCommerceIfConsummated (eoOffense o) c

axiom corr_federalVictim {v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrFederalPersonnel v o c →
    Ontology.FederalVictimOfOffense (eoOffense o) c

axiom corr_federalProperty {pr : Elements.Property} {c : ComplaintText} :
    Elements.PropertyOwnedPossessedOrLeasedToTheUnitedStates pr c →
    Ontology.FederalPropertyInterest (eoProperty pr) (eoEntity pr) c

axiom corr_territorialSeaLocus {o : Elements.Offense} {c : ComplaintText} :
    Elements.TerritorialSeaOfTheUnitedStates o c →
    Ontology.TerritorialSeaLocus (eoLocale o) c

axiom corr_committedInSea {o : Elements.Offense} {c : ComplaintText} :
    Elements.TerritorialSeaOfTheUnitedStates o c →
    Ontology.OffenseCommittedInLocale (eoOffense o) (eoLocale o) c

axiom corr_smtjLocale {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    Ontology.IsWithinSpecialMaritimeAndTerritorialJurisdiction (eoLocale o) c

axiom corr_committedInSmtj {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    Ontology.OffenseCommittedInLocale (eoOffense o) (eoLocale o) c

theorem s2332b_b1_elements_implies_ontology
    {o : Elements.Offense} {v : Person} {pr : Elements.Property} {c : ComplaintText}
    (h : Elements.CircumstanceUnderSubsectionB o v pr c) :
    Ontology.CircumstanceDescribedInSubsectionB (eoCircumstance o) (eoOffense o) c :=
  match h with
  | .facilityOfCommerce hf =>
      .mailOrCommerceFacility (eoFacility o) (corr_attaches h) (corr_facility hf)
  | .commerceEffect he =>
      .commerceEffect (corr_attaches h)
        (match he with
          | .actual ha => .actual (corr_commerceActual ha)
          | .ifConsummated hb => .counterfactual (corr_commerceCounterfactual hb))
  | .federalVictim hv => .federalVictim (corr_attaches h) (corr_federalVictim hv)
  | .federalProperty hp =>
      .federalProperty (eoProperty pr) (eoEntity pr) (corr_attaches h) (corr_federalProperty hp)
  | .territorialSea ht =>
      .territorialSea (eoLocale o) (corr_attaches h) (corr_committedInSea ht)
        (corr_territorialSeaLocus ht)
  | .specialMaritime hs =>
      .specialMaritimeJurisdiction (eoLocale o) (corr_attaches h) (corr_committedInSmtj hs)
        (corr_smtjLocale hs)



axiom corr_kills {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.KillsPerson p o v c → Ontology.KillsPerson (eoConduct o) v c

axiom corr_kidnaps {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.KidnapsPerson p o v c → Ontology.KidnapsPerson (eoConduct o) v c

axiom corr_maims {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.MaimsPerson p o v c → Ontology.MaimsPerson (eoConduct o) v c

axiom corr_assaultSbi {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.CommitsAssaultResultingInSeriousBodilyInjury p o v c →
    Ontology.AssaultResultingInSeriousBodilyInjury (eoConduct o) v (eoInjury o) c

axiom corr_assaultDw {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.AssaultsWithADangerousWeapon p o v c →
    Ontology.AssaultWithDangerousWeapon (eoConduct o) v c

axiom corr_personLocus {v : Person} {c : ComplaintText} :
    IsPersonInUS v c → Ontology.IsPersonWithinTheUnitedStates v c

axiom corr_risk {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.CreatesSubstantialRiskOfSeriousBodilyInjury p o c →
    Ontology.CreatesSubstantialRiskOfSeriousBodilyInjuryToAnotherPerson
      (eoConduct o) (eoRiskVictim o) c

axiom corr_destroys {p : Person} {o : Elements.Offense} {pr : Elements.Property}
    {c : ComplaintText} :
    Elements.DestroysOrDamagesProperty p o pr c →
    Ontology.DestroysOrDamagesProperty (eoConduct o) (eoProperty pr) c

axiom corr_attemptsProperty {p : Person} {o : Elements.Offense} {pr : Elements.Property}
    {c : ComplaintText} :
    Elements.AttemptsOrConspiresToDestroyOrDamageProperty p o pr c →
    Ontology.AttemptsOrConspiresToDestroyOrDamageProperty (eoConduct o) (eoProperty pr) c

axiom corr_propertyKind {pr : Elements.Property} {c : ComplaintText} :
    Elements.IsStructureConveyanceOrOtherProperty pr c →
    Ontology.IsStructureConveyanceOrOtherRealOrPersonalProperty (eoProperty pr) c

axiom corr_propertyLocus {pr : Elements.Property} {c : ComplaintText} :
    Elements.PropertyIsWithinTheUnitedStates pr c →
    Ontology.IsLocatedWithinTheUnitedStates (eoProperty pr) c

theorem s2332b_a1_conduct_elements_implies_ontology
    {p : Person} {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (h : Elements.ProhibitedConductUnderParagraph1 p o v pr c) :
    Ontology.ProhibitedConductUnderParagraphA1 (eoConduct o) c :=
  match h with
  | .violentAct hv =>
      .againstPerson v
        (match hv.act with
          | .kills hk => .kills (corr_kills hk) (corr_personLocus hv.victimWithinTheUS)
          | .kidnaps hk => .kidnaps (corr_kidnaps hk) (corr_personLocus hv.victimWithinTheUS)
          | .maims hm => .maims (corr_maims hm) (corr_personLocus hv.victimWithinTheUS)
          | .assaultSeriousInjury ha =>
              .assaultSeriousBodilyInjury (eoInjury o) (corr_assaultSbi ha)
                (corr_personLocus hv.victimWithinTheUS)
          | .assaultDangerousWeapon ha =>
              .assaultDangerousWeapon (corr_assaultDw ha)
                (corr_personLocus hv.victimWithinTheUS))
  | .propertyRisk hp =>
      .againstProperty (eoProperty pr) (eoRiskVictim o)
        ⟨corr_risk hp.risk,
         (match hp.means with
            | .destroysOrDamages hd => .destroysOrDamages (corr_destroys hd)
            | .attemptsOrConspires ha => .attemptsOrConspires (corr_attemptsProperty ha)),
         ⟨corr_propertyKind hp.propertyClass, corr_propertyLocus hp.propertyWithinTheUS⟩⟩

axiom corr_stateLawSource {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfAnyState p o c → Ontology.IsLawOfAState (eoLaw o) c

axiom corr_stateLawViolated {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfAnyState p o c →
    Ontology.ViolatesLawProvision (eoConduct o) (eoLaw o) c

axiom corr_federalLawSource {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfTheUnitedStates p o c → Ontology.IsLawOfTheUnitedStates (eoLaw o) c

axiom corr_federalLawViolated {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfTheUnitedStates p o c →
    Ontology.ViolatesLawProvision (eoConduct o) (eoLaw o) c

theorem s2332b_a1_unlawful_elements_implies_ontology
    {p : Person} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.InViolationOfStateOrFederalLaw p o c) :
    Ontology.ViolationOfStateOrFederalLaw (eoConduct o) (eoLaw o) c :=
  match h with
  | .stateLaw hs => ⟨.state (corr_stateLawSource hs), corr_stateLawViolated hs⟩
  | .federalLaw hf => ⟨.federal (corr_federalLawSource hf), corr_federalLawViolated hf⟩

axiom corr_constitutes {p : Person} {o : Elements.Offense} {v : Person}
    {pr : Elements.Property} {c : ComplaintText} :
    Elements.Section2332bA1 p o v pr c →
    Ontology.OffenseConsistsOfConduct (eoOffense o) (eoConduct o) c

theorem s2332b_a1_elements_implies_ontology
    {p : Person} {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (h : Elements.Section2332bA1 p o v pr c) :
    Ontology.OffenseUnderParagraphA1 (eoOffense o) (eoConduct o) (eoCircumstance o) (eoLaw o) c :=
  ⟨corr_constitutes h,
   s2332b_g1_elements_implies_ontology h.transnational,
   s2332b_b1_elements_implies_ontology h.circumstance,
   s2332b_a1_conduct_elements_implies_ontology h.prohibitedConduct,
   s2332b_a1_unlawful_elements_implies_ontology h.unlawful⟩



axiom corr_threatens {p : Person} {o obj : Elements.Offense} {c : ComplaintText} :
    Elements.ThreatRoute p o obj c →
    Ontology.ThreatensToCommitOffense (eoConduct o) (eoOffense obj) c

axiom corr_attempts {p : Person} {o obj : Elements.Offense} {c : ComplaintText} :
    Elements.AttemptRoute p o obj c →
    Ontology.AttemptsToCommitOffense (eoConduct o) (eoOffense obj) c

axiom corr_conspires {p : Person} {o obj : Elements.Offense} {ag : Agreement}
    {c : ComplaintText} :
    Elements.InchoateModalityUnderParagraph2 p o obj ag c →
    Elements.ConspiracyRoute p obj ag c →
    Ontology.ConspiresToCommitOffense (eoConduct o) (eoOffense obj) c




theorem s2332b_a2_elements_implies_ontology
    {p : Person} {o obj : Elements.Offense} {v : Person} {pr : Elements.Property}
    {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332bA2 p o obj v pr ag c) :
    Ontology.InchoateOffenseUnderParagraphA2 (eoConduct o) (eoOffense obj) c :=
  match h.modality with
  | .threat ht =>
      .threatens (eoConduct obj) (eoCircumstance obj) (eoLaw obj)
        (s2332b_a1_elements_implies_ontology h.objectOffense) (corr_threatens ht)
  | .attempt ha =>
      .attempts (eoConduct obj) (eoCircumstance obj) (eoLaw obj)
        (s2332b_a1_elements_implies_ontology h.objectOffense) (corr_attempts ha)
  | .conspiracy hc =>
      .conspires (eoConduct obj) (eoCircumstance obj) (eoLaw obj)
        (s2332b_a1_elements_implies_ontology h.objectOffense)
        (corr_conspires h.modality hc)



axiom corr_motiveInfluence {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceGovernmentByIntimidationOrCoercion o c →
    Ontology.IsCalculatedToInfluenceGovernmentConductByIntimidationOrCoercion (eoOffense o) c

axiom corr_motiveRetaliate {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToRetaliateAgainstGovernmentConduct o c →
    Ontology.IsCalculatedToRetaliateAgainstGovernmentConduct (eoOffense o) c

axiom corr_title18 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle18Provision o c →
    Ontology.ViolatesEnumeratedTitle18TerrorismProvision (eoOffense o) c

axiom corr_aea {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedAtomicEnergyActProvision o c →
    Ontology.ViolatesEnumeratedAtomicEnergyActProvision (eoOffense o) c

axiom corr_title49 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle49Provision o c →
    Ontology.ViolatesEnumeratedTitle49Provision (eoOffense o) c

axiom corr_narco {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesSection1010ANarcoTerrorism o c →
    Ontology.ViolatesNarcoterrorismProvision (eoOffense o) c

theorem s2332b_g5_elements_implies_ontology
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism o c) :
    Ontology.FederalCrimeOfTerrorism (eoOffense o) c :=
  ⟨(match h.motive with
      | .influenceGovernment hi => .influenceOrCoerce (corr_motiveInfluence hi)
      | .retaliate hr => .retaliate (corr_motiveRetaliate hr)),
   (match h.enumeratedOffense with
      | .title18 h18 => .title18 (corr_title18 h18)
      | .atomicEnergyAct ha => .atomicEnergyAct (corr_aea ha)
      | .title49 h49 => .title49 (corr_title49 h49)
      | .narcoTerrorism hn => .narcoterrorism (corr_narco hn))⟩

end EO










namespace EP

axiom epOffense : Elements.Offense → Procedure.Offense

axiom corr_within {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurringWithinTheUnitedStates o c →
    Procedure.ConductOccurredWithinUnitedStates (epOffense o) c

axiom corr_outside {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurringOutsideTheUnitedStates o c →
    Procedure.ConductOccurredOutsideUnitedStates (epOffense o) c

theorem s2332b_g1_elements_implies_procedure
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.ConductTranscendingNationalBoundaries o c) :
    Procedure.ConductTranscendsNationalBoundaries (epOffense o) c :=
  ⟨corr_within h.domestic, corr_outside h.abroad⟩

axiom corr_facility {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfCommerceUsedInFurtherance o c →
    ∃ y : Person, Procedure.MailOrInterstateFacilityUsedInFurtherance (epOffense o) y c

axiom corr_commerceActual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateOrForeignCommerce o c →
    ∃ y : Person, Procedure.OffenseObstructedDelayedOrAffectedCommerce (epOffense o) y c

axiom corr_commerceCounterfactual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseWouldHaveAffectedCommerceIfConsummated o c →
    ∃ y : Person, Procedure.OffenseWouldHaveAffectedCommerceIfConsummated (epOffense o) y c

axiom corr_federalVictim {v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrFederalPersonnel v o c →
    ∃ y : Person, Procedure.FederalVictimCircumstance (epOffense o) y c




axiom corr_federalProperty {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText} :
    Elements.CircumstanceUnderSubsectionB o v pr c →
    Elements.PropertyOwnedPossessedOrLeasedToTheUnitedStates pr c →
    ∃ y : Person, Procedure.PropertyOwnedPossessedOrLeasedByUnitedStates (epOffense o) y c

axiom corr_territorialSea {o : Elements.Offense} {c : ComplaintText} :
    Elements.TerritorialSeaOfTheUnitedStates o c →
    ∃ y : Person, Procedure.TerritorialSeaCircumstance (epOffense o) y c

axiom corr_smtj {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    ∃ y : Person,
      Procedure.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction (epOffense o) y c

theorem s2332b_b1_elements_implies_procedure
    {o : Elements.Offense} {v : Person} {pr : Elements.Property} {c : ComplaintText}
    (h : Elements.CircumstanceUnderSubsectionB o v pr c) :
    Procedure.CircumstanceApplicableToSomeOffender (epOffense o) c :=
  match h with
  | .facilityOfCommerce hf =>
      Exists.elim (corr_facility hf) (fun y hy => ⟨y, .mailOrInterstateFacility hy⟩)
  | .commerceEffect he =>
      match he with
      | .actual ha =>
          Exists.elim (corr_commerceActual ha)
            (fun y hy => ⟨y, .commerceEffect (.actual hy)⟩)
      | .ifConsummated hb =>
          Exists.elim (corr_commerceCounterfactual hb)
            (fun y hy => ⟨y, .commerceEffect (.ifConsummated hy)⟩)
  | .federalVictim hv =>
      Exists.elim (corr_federalVictim hv) (fun y hy => ⟨y, .federalVictim hy⟩)
  | .federalProperty hp =>
      Exists.elim (corr_federalProperty h hp) (fun y hy => ⟨y, .federalProperty hy⟩)
  | .territorialSea ht =>
      Exists.elim (corr_territorialSea ht) (fun y hy => ⟨y, .territorialSea hy⟩)
  | .specialMaritime hs =>
      Exists.elim (corr_smtj hs)
        (fun y hy => ⟨y, .specialMaritimeAndTerritorialJurisdiction hy⟩)

axiom corr_principal {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsAPrincipalOfTheOffense p o c → Procedure.IsPrincipalOfOffense p (epOffense o) c

axiom corr_coconspirator {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsACoconspiratorOfTheOffense p o c →
    Procedure.IsCoConspiratorOfOffense p (epOffense o) c

axiom corr_accessory {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.IsAnAccessoryAfterTheFactToTheOffense p o c →
    Procedure.IsAccessoryAfterTheFactToOffense p (epOffense o) c












theorem s2332b_b2_elements_implies_procedure_modulo_gaps
    {p : Person} {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (gap_b2_charged : Procedure.ChargedAsOffenseUnderThisSection (epOffense o) c)
    (h : Elements.JurisdictionUnderSubsectionB p o v pr c) :
    Procedure.JurisdictionOverOffender p (epOffense o) c :=
  ⟨gap_b2_charged,
   (match h.role with
      | .principal hx => .principal (corr_principal hx)
      | .coconspirator hx => .coConspirator (corr_coconspirator hx)
      | .accessoryAfterTheFact hx => .accessoryAfterTheFact (corr_accessory hx)),
   s2332b_b1_elements_implies_procedure h.circumstance⟩

axiom corr_motiveInfluence {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceGovernmentByIntimidationOrCoercion o c →
    Procedure.CalculatedToInfluenceGovernmentConduct (epOffense o) c

axiom corr_motiveRetaliate {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToRetaliateAgainstGovernmentConduct o c →
    Procedure.CalculatedToRetaliateAgainstGovernmentConduct (epOffense o) c

axiom corr_title18 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle18Provision o c →
    Procedure.ViolatesEnumeratedTitle18TerrorismOffense (epOffense o) c

axiom corr_aea {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedAtomicEnergyActProvision o c →
    Procedure.ViolatesAtomicEnergyActOffense (epOffense o) c

axiom corr_title49 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle49Provision o c →
    Procedure.ViolatesEnumeratedTitle49Offense (epOffense o) c

axiom corr_narco {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesSection1010ANarcoTerrorism o c →
    Procedure.ViolatesNarcoterrorismOffense (epOffense o) c

theorem s2332b_g5_elements_implies_procedure
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism o c) :
    Procedure.FederalCrimeOfTerrorism (epOffense o) c :=
  ⟨(match h.motive with
      | .influenceGovernment hi => .influenceOrAffectGovernmentConduct (corr_motiveInfluence hi)
      | .retaliate hr => .retaliateAgainstGovernmentConduct (corr_motiveRetaliate hr)),
   (match h.enumeratedOffense with
      | .title18 h18 => .title18Offense (corr_title18 h18)
      | .atomicEnergyAct ha => .atomicEnergyActOffense (corr_aea ha)
      | .title49 h49 => .title49Offense (corr_title49 h49)
      | .narcoTerrorism hn => .narcoterrorismOffense (corr_narco hn))⟩

end EP









namespace DP

axiom dpOffense : Deontic.Offense → Procedure.Offense
axiom dpStateProv : Deontic.Prosecution → Procedure.StateLawProvision
axiom dpProsOffense : Deontic.Prosecution → Procedure.Offense
axiom doLaw : Deontic.Prosecution → Ontology.LawProvision



axiom corr_motiveInfluence {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.CalculatedToInfluenceOrAffectGovernmentConductByIntimidationOrCoercion o c →
    Procedure.CalculatedToInfluenceGovernmentConduct (dpOffense o) c

axiom corr_motiveRetaliate {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.CalculatedToRetaliateAgainstGovernmentConduct o c →
    Procedure.CalculatedToRetaliateAgainstGovernmentConduct (dpOffense o) c

axiom corr_title18 {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolatesEnumeratedTitle18TerrorismProvision o c →
    Procedure.ViolatesEnumeratedTitle18TerrorismOffense (dpOffense o) c

axiom corr_aea {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolatesEnumeratedAtomicEnergyActProvision o c →
    Procedure.ViolatesAtomicEnergyActOffense (dpOffense o) c

axiom corr_title49 {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolatesEnumeratedTitle49Provision o c →
    Procedure.ViolatesEnumeratedTitle49Offense (dpOffense o) c

axiom corr_narco {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolatesNarcoTerrorismProvision o c →
    Procedure.ViolatesNarcoterrorismOffense (dpOffense o) c

theorem s2332b_g5_deontic_implies_procedure
    {o : Deontic.Offense} {c : ComplaintText}
    (h : Deontic.FederalCrimeOfTerrorism o c) :
    Procedure.FederalCrimeOfTerrorism (dpOffense o) c :=
  ⟨(match h.motive with
      | .influenceOrAffect hi => .influenceOrAffectGovernmentConduct (corr_motiveInfluence hi)
      | .retaliate hr => .retaliateAgainstGovernmentConduct (corr_motiveRetaliate hr)),
   (match h.enumerated with
      | .title18 h18 => .title18Offense (corr_title18 h18)
      | .atomicEnergyAct ha => .atomicEnergyActOffense (corr_aea ha)
      | .title49 h49 => .title49Offense (corr_title49 h49)
      | .narcoTerrorism hn => .narcoterrorismOffense (corr_narco hn))⟩



axiom corr_personClass {p : Person} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.JurisdictionalPersonClass2332bB2 p o c →
    Procedure.CoveredOffenderRole p (dpOffense o) c

axiom corr_circumstanceApplicable {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.CircumstanceApplicableToAtLeastOneOffender o c →
    Procedure.CircumstanceApplicableToSomeOffender (dpOffense o) c

theorem s2332b_b2_deontic_implies_procedure_modulo_gaps
    {p : Person} {o : Deontic.Offense} {c : ComplaintText}
    (gap_b2_charged : Procedure.ChargedAsOffenseUnderThisSection (dpOffense o) c)
    (h : Deontic.Power2332bB2 p o c) :
    Procedure.JurisdictionOverOffender p (dpOffense o) c :=
  ⟨gap_b2_charged,
   corr_personClass h.personClass,
   corr_circumstanceApplicable h.circumstanceApplicable⟩



axiom corr_offenseUnderA {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.OffenseUnderSubsectionA o c → Procedure.OffenseIsUnderSubsectionA (dpOffense o) c

axiom corr_accessoryS3 {p : Person} {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.IsAccessoryAfterTheFactUnderSection3 p o c →
    Procedure.ConductRendersAccessoryAfterTheFactUnderSection3 p (dpOffense o) c



theorem s2332bE_deontic_implies_procedure
    {p : Person} {o : Deontic.Offense} {c : ComplaintText}
    (h : Deontic.ExtraterritorialJurisdictionBasis2332bE p o c) :
    Procedure.ExtraterritorialJurisdiction p (dpOffense o) c :=
  match h with
  | .offenseUnderSubsectionA hA _ => .subsectionAOffense (corr_offenseUnderA hA)
  | .accessoryAfterTheFact hA hAcc =>
      .accessoryAfterTheFact (corr_offenseUnderA hA) (corr_accessoryS3 hAcc)



axiom corr_listedF {o : Deontic.Offense} {c : ComplaintText} :
    Deontic.ViolatesProvisionEnumeratedInSubsectionF o c →
    Procedure.ViolatesSectionListedInSubsectionF (dpOffense o) c




theorem s2332bF_ag_deontic_implies_procedure
    {p : Person} {o : Deontic.Offense} {c : ComplaintText}
    (h : Deontic.Obligation2332bFAttorneyGeneral p o c) :
    Procedure.AttorneyGeneralPrimaryInvestigativeResponsibility (dpOffense o) c :=
  match h.matter with
  | .federalCrimeOfTerrorism hf =>
      .federalCrimeOfTerrorism (s2332b_g5_deontic_implies_procedure hf)
  | .enumeratedSectionViolation hv => .listedSectionViolation (corr_listedF hv)











theorem s2332bF_treasury_deontic_implies_procedure_modulo_gaps
    {p : Person} {o : Deontic.Offense} {c : ComplaintText}
    (gap_f_treasuryScope :
      Procedure.AttorneyGeneralPrimaryInvestigativeResponsibility (dpOffense o) c)
    (gap_f_treasuryRequestIsOffenseScoped :
      Deontic.AttorneyGeneralRequestedAssistance c →
      Procedure.AttorneyGeneralRequestedTreasuryAssistance (dpOffense o) c)
    (h : Deontic.Obligation2332bFTreasury p c) :
    Procedure.TreasuryAssistanceDuty (dpOffense o) c :=
  ⟨gap_f_treasuryScope, gap_f_treasuryRequestIsOffenseScoped h.requested⟩



axiom corr_basedOnStateLaw {pros : Deontic.Prosecution} {c : ComplaintText} :
    Deontic.ProsecutionBasedOnAdoptionOfStateLaw pros c →
    Procedure.ProsecutionBasedOnAdoptedStateLaw (dpProsOffense pros) c

axiom corr_definesElement {pros : Deontic.Prosecution} {c : ComplaintText} :
    Deontic.AdoptedOnlyElementsOfOffenseUnderStateLaw pros c →
    Procedure.StateProvisionDefinesElementOfOffense (dpStateProv pros) (dpProsOffense pros) c

axiom corr_notProcedural {pros : Deontic.Prosecution} {c : ComplaintText} :
    ¬ Deontic.AdoptedStateProvisionPertainingToCriminalProcedureOrEvidence pros c →
    ¬ Procedure.StateProvisionPertainsToCriminalProcedureOrEvidence (dpStateProv pros) c




theorem s2332bD2_deontic_implies_procedure
    {pros : Deontic.Prosecution} {c : ComplaintText}
    (h : Deontic.Prohibition2332bD2Complied pros c) :
    Procedure.StateLawAdoptionScope (dpProsOffense pros) (dpStateProv pros) c :=
  ⟨corr_basedOnStateLaw h.1.basedOnStateLaw, corr_definesElement h.2.1,
   corr_notProcedural h.2.2⟩

axiom corr_onElement {pros : Deontic.Prosecution} {c : ComplaintText} :
    Deontic.AdoptedOnlyElementsOfOffenseUnderStateLaw pros c →
    Ontology.IsElementOfTheOffenseUnderStateLaw (doLaw pros) c

axiom corr_onNotProcedural {pros : Deontic.Prosecution} {c : ComplaintText} :
    ¬ Deontic.AdoptedStateProvisionPertainingToCriminalProcedureOrEvidence pros c →
    ¬ Ontology.IsProvisionPertainingToCriminalProcedureOrEvidence (doLaw pros) c


theorem s2332bD2_deontic_implies_ontology
    {pros : Deontic.Prosecution} {c : ComplaintText}
    (h : Deontic.Prohibition2332bD2Complied pros c) :
    Ontology.AdoptedStateLawContent (doLaw pros) c :=
  ⟨corr_onElement h.2.1, corr_onNotProcedural h.2.2⟩

end DP

end Proving.USC.T18.Ch113B.Wmd.Part2.Bridge
