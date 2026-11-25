































import Proving.USC.T18.Ch113B.Wmd.Part2.Elements.Statute
import Proving.Terrorism.Statute
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch113B.Wmd.Part2.GoldenBridge

open Proving.USC.Common



axiom gPerson : Person → Proving.Terrorism.Person
axiom gAction : Elements.Offense → Proving.Terrorism.Action
axiom gComplaint : ComplaintText → Proving.Terrorism.ComplaintText








axiom gcorr_transcending {o : Elements.Offense} {c : ComplaintText} :
    Elements.ConductOccurringOutsideTheUnitedStates o c →
    Elements.ConductOccurringWithinTheUnitedStates o c →
    Proving.Terrorism.ConductTranscendingNationalBoundaries (gAction o) (gComplaint c)

theorem cand_transcending_implies_golden
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.ConductTranscendingNationalBoundaries o c) :
    Proving.Terrorism.ConductTranscendingNationalBoundaries (gAction o) (gComplaint c) :=
  gcorr_transcending h.abroad h.domestic








axiom gcorr_circFacility {o : Elements.Offense} {c : ComplaintText} :
    Elements.MailOrFacilityOfCommerceUsedInFurtherance o c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)

axiom gcorr_circCommerceActual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseAffectsInterstateOrForeignCommerce o c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)

axiom gcorr_circCommerceCounterfactual {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseWouldHaveAffectedCommerceIfConsummated o c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)

axiom gcorr_circFederalVictim {v : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.VictimIsUnitedStatesGovernmentOrFederalPersonnel v o c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)

axiom gcorr_circFederalProperty {o : Elements.Offense} {v : Person}
    {pr : Elements.Property} {c : ComplaintText} :
    Elements.CircumstanceUnderSubsectionB o v pr c →
    Elements.PropertyOwnedPossessedOrLeasedToTheUnitedStates pr c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)

axiom gcorr_circTerritorialSea {o : Elements.Offense} {c : ComplaintText} :
    Elements.TerritorialSeaOfTheUnitedStates o c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)

axiom gcorr_circSmtj {o : Elements.Offense} {c : ComplaintText} :
    Elements.OffenseCommittedWithinSpecialMaritimeAndTerritorialJurisdiction o c →
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c)

theorem cand_circumstance_implies_golden
    {o : Elements.Offense} {v : Person} {pr : Elements.Property} {c : ComplaintText}
    (h : Elements.CircumstanceUnderSubsectionB o v pr c) :
    Proving.Terrorism.JurisdictionalCircumstanceExists (gAction o) (gComplaint c) :=
  match h with
  | .facilityOfCommerce hf => gcorr_circFacility hf
  | .commerceEffect he =>
      match he with
      | .actual ha => gcorr_circCommerceActual ha
      | .ifConsummated hb => gcorr_circCommerceCounterfactual hb
  | .federalVictim hv => gcorr_circFederalVictim hv
  | .federalProperty hp => gcorr_circFederalProperty h hp
  | .territorialSea ht => gcorr_circTerritorialSea ht
  | .specialMaritime hs => gcorr_circSmtj hs







axiom gcorr_kills {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.KillsPerson p o v c → IsPersonInUS v c →
    Proving.Terrorism.ViolentActAgainstPersonWithinUs (gPerson p) (gAction o) (gComplaint c)

axiom gcorr_kidnaps {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.KidnapsPerson p o v c → IsPersonInUS v c →
    Proving.Terrorism.ViolentActAgainstPersonWithinUs (gPerson p) (gAction o) (gComplaint c)

axiom gcorr_maims {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.MaimsPerson p o v c → IsPersonInUS v c →
    Proving.Terrorism.ViolentActAgainstPersonWithinUs (gPerson p) (gAction o) (gComplaint c)

axiom gcorr_assaultSbi {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.CommitsAssaultResultingInSeriousBodilyInjury p o v c → IsPersonInUS v c →
    Proving.Terrorism.ViolentActAgainstPersonWithinUs (gPerson p) (gAction o) (gComplaint c)

axiom gcorr_assaultDw {p : Person} {o : Elements.Offense} {v : Person} {c : ComplaintText} :
    Elements.AssaultsWithADangerousWeapon p o v c → IsPersonInUS v c →
    Proving.Terrorism.ViolentActAgainstPersonWithinUs (gPerson p) (gAction o) (gComplaint c)












axiom gcorr_propertyHarmDestroys {p : Person} {o : Elements.Offense}
    {pr : Elements.Property} {c : ComplaintText} :
    Elements.DestroysOrDamagesProperty p o pr c →
    Elements.CreatesSubstantialRiskOfSeriousBodilyInjury p o c →
    Elements.SubstantialRiskArisesFromThePropertyConduct o pr c →
    Elements.IsStructureConveyanceOrOtherProperty pr c →
    Elements.PropertyIsWithinTheUnitedStates pr c →
    Proving.Terrorism.PropertyHarmCreatingRiskOfSeriousBodilyInjury
      (gPerson p) (gAction o) (gComplaint c)

axiom gcorr_propertyHarmAttempts {p : Person} {o : Elements.Offense}
    {pr : Elements.Property} {c : ComplaintText} :
    Elements.AttemptsOrConspiresToDestroyOrDamageProperty p o pr c →
    Elements.CreatesSubstantialRiskOfSeriousBodilyInjury p o c →
    Elements.SubstantialRiskArisesFromThePropertyConduct o pr c →
    Elements.IsStructureConveyanceOrOtherProperty pr c →
    Elements.PropertyIsWithinTheUnitedStates pr c →
    Proving.Terrorism.PropertyHarmCreatingRiskOfSeriousBodilyInjury
      (gPerson p) (gAction o) (gComplaint c)

theorem cand_conduct_implies_golden
    {p : Person} {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (h : Elements.ProhibitedConductUnderParagraph1 p o v pr c) :
    Proving.Terrorism.Section2332bConduct (gPerson p) (gAction o) (gComplaint c) :=
  match h with
  | .violentAct hv =>
      .viaViolenceAgainstPerson
        (match hv.act with
          | .kills hk => gcorr_kills hk hv.victimWithinTheUS
          | .kidnaps hk => gcorr_kidnaps hk hv.victimWithinTheUS
          | .maims hm => gcorr_maims hm hv.victimWithinTheUS
          | .assaultSeriousInjury ha => gcorr_assaultSbi ha hv.victimWithinTheUS
          | .assaultDangerousWeapon ha => gcorr_assaultDw ha hv.victimWithinTheUS)
  | .propertyRisk hp =>
      .viaPropertyHarm
        (match hp.means with
          | .destroysOrDamages hd =>
              gcorr_propertyHarmDestroys hd hp.risk hp.riskFromMeans hp.propertyClass
                hp.propertyWithinTheUS
          | .attemptsOrConspires ha =>
              gcorr_propertyHarmAttempts ha hp.risk hp.riskFromMeans hp.propertyClass
                hp.propertyWithinTheUS)



axiom gcorr_stateLaw {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfAnyState p o c →
    Proving.Terrorism.InViolationOfStateOrFederalLaw (gAction o) (gComplaint c)

axiom gcorr_federalLaw {p : Person} {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesTheLawOfTheUnitedStates p o c →
    Proving.Terrorism.InViolationOfStateOrFederalLaw (gAction o) (gComplaint c)

theorem cand_unlawful_implies_golden
    {p : Person} {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.InViolationOfStateOrFederalLaw p o c) :
    Proving.Terrorism.InViolationOfStateOrFederalLaw (gAction o) (gComplaint c) :=
  match h with
  | .stateLaw hs => gcorr_stateLaw hs
  | .federalLaw hf => gcorr_federalLaw hf







theorem cand_s2332b_a1_implies_golden
    {p : Person} {o : Elements.Offense} {v : Person} {pr : Elements.Property}
    {c : ComplaintText}
    (h : Elements.Section2332bA1 p o v pr c) :
    Proving.Terrorism.Section2332bSubsecA1 (gPerson p) (gAction o) (gComplaint c) :=
  ⟨cand_transcending_implies_golden h.transnational,
   cand_circumstance_implies_golden h.circumstance,
   cand_conduct_implies_golden h.prohibitedConduct,
   cand_unlawful_implies_golden h.unlawful⟩



axiom gcorr_threatens {p : Person} {o obj : Elements.Offense} {c : ComplaintText} :
    Elements.ThreatRoute p o obj c →
    Proving.Terrorism.ThreatensAttemptsOrConspiresUnderSection2332b
      (gPerson p) (gAction obj) (gComplaint c)

axiom gcorr_attempts {p : Person} {o obj : Elements.Offense} {c : ComplaintText} :
    Elements.AttemptRoute p o obj c →
    Proving.Terrorism.ThreatensAttemptsOrConspiresUnderSection2332b
      (gPerson p) (gAction obj) (gComplaint c)

axiom gcorr_conspires {p : Person} {o obj : Elements.Offense} {ag : Agreement}
    {c : ComplaintText} :
    Elements.InchoateModalityUnderParagraph2 p o obj ag c →
    Elements.ConspiracyRoute p obj ag c →
    Proving.Terrorism.ThreatensAttemptsOrConspiresUnderSection2332b
      (gPerson p) (gAction obj) (gComplaint c)






theorem cand_s2332b_a2_implies_golden
    {p : Person} {o obj : Elements.Offense} {v : Person} {pr : Elements.Property}
    {ag : Agreement} {c : ComplaintText}
    (h : Elements.Section2332bA2 p o obj v pr ag c) :
    Proving.Terrorism.Section2332bSubsecA2 (gPerson p) (gAction obj) (gComplaint c) :=
  ⟨cand_transcending_implies_golden h.objectOffense.transnational,
   cand_circumstance_implies_golden h.objectOffense.circumstance,
   (match h.modality with
      | .threat ht => gcorr_threatens ht
      | .attempt ha => gcorr_attempts ha
      | .conspiracy hc => gcorr_conspires h.modality hc)⟩



axiom gcorr_motiveInfluence {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToInfluenceGovernmentByIntimidationOrCoercion o c →
    Proving.Terrorism.CalculatedToInfluenceOrRetaliateAgainstGovernment
      (gAction o) (gComplaint c)

axiom gcorr_motiveRetaliate {o : Elements.Offense} {c : ComplaintText} :
    Elements.CalculatedToRetaliateAgainstGovernmentConduct o c →
    Proving.Terrorism.CalculatedToInfluenceOrRetaliateAgainstGovernment
      (gAction o) (gComplaint c)

axiom gcorr_enumTitle18 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle18Provision o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense (gAction o) (gComplaint c)

axiom gcorr_enumAea {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedAtomicEnergyActProvision o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense (gAction o) (gComplaint c)

axiom gcorr_enumTitle49 {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesAnEnumeratedTitle49Provision o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense (gAction o) (gComplaint c)

axiom gcorr_enumNarco {o : Elements.Offense} {c : ComplaintText} :
    Elements.ViolatesSection1010ANarcoTerrorism o c →
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense (gAction o) (gComplaint c)

theorem cand_enumerated_implies_golden
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.EnumeratedTerrorismOffense o c) :
    Proving.Terrorism.ViolatesEnumeratedTerrorismOffense (gAction o) (gComplaint c) :=
  match h with
  | .title18 h18 => gcorr_enumTitle18 h18
  | .atomicEnergyAct ha => gcorr_enumAea ha
  | .title49 h49 => gcorr_enumTitle49 h49
  | .narcoTerrorism hn => gcorr_enumNarco hn





theorem cand_s2332b_g5_implies_golden
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.FederalCrimeOfTerrorism o c) :
    Proving.Terrorism.FederalCrimeOfTerrorism (gAction o) (gComplaint c) :=
  ⟨(match h.motive with
      | .influenceGovernment hi => gcorr_motiveInfluence hi
      | .retaliate hr => gcorr_motiveRetaliate hr),
   cand_enumerated_implies_golden h.enumeratedOffense⟩










theorem cand_implies_golden_clauseG
    {o : Elements.Offense} {c : ComplaintText}
    (h : Elements.EnumeratedTerrorismOffense o c) :
    Proving.Terrorism.RicoPredicateActUnderClauseG (gAction o) (gComplaint c) :=
  ⟨cand_enumerated_implies_golden h⟩

end Proving.USC.T18.Ch113B.Wmd.Part2.GoldenBridge
