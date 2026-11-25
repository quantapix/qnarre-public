

































import Proving.USC.T18.Enf.Elements.Statute
import Proving.USC.T18.Enf.Deontic.Statute
import Proving.USC.T18.Enf.Ontology.Statute
import Proving.USC.T18.Enf.Procedure.Statute
import Proving.USC.T18.Enf.Structure.Statute
import Proving.Rico.Statute

namespace Proving.USC.T18.Enf.Bridge

open Proving.USC.Common









axiom mapElemProp_toDeonProp : Elements.Property → Deontic.Property
axiom mapElemProp_toOntoProp : Elements.Property → Ontology.Property
axiom mapElemProp_toOntoInt  : Elements.Property → Ontology.Interest















axiom corr_convicted_toViolated {p c} :
    Elements.ConvictedOfSection1962 p c → Deontic.ViolatedSection1962 p c
axiom corr_propNexus_toForfeitable {prop : Elements.Property} {p c} :
    Elements.PropertySubjectToForfeiture prop p c →
    Deontic.PropertyForfeitable (mapElemProp_toDeonProp prop) c





theorem s1963_elements_implies_deontic_modulo_gaps
    {p : Person} {prop : Elements.Property} {c : ComplaintText}
    (h : Elements.Section1963 p prop c)
    (gap_forfeitureNotTendered :
      Deontic.ForfeitureNotTendered p (mapElemProp_toDeonProp prop) c) :
    Deontic.Obligation1963aBreached p (mapElemProp_toDeonProp prop) c :=
  ⟨⟨corr_convicted_toViolated h.conviction,
    corr_propNexus_toForfeitable h.property⟩,
   gap_forfeitureNotTendered⟩







axiom corr_convicted_toOntoViolation {p c} :
    Elements.ConvictedOfSection1962 p c → Ontology.IsSection1962Violation p c
axiom corr_propNexus_toForfeitableInterest {prop : Elements.Property} {p c} :
    Elements.PropertySubjectToForfeiture prop p c →
    Ontology.IsForfeitableInterest (mapElemProp_toOntoInt prop) c



theorem s1963_elements_implies_ontology
    {p : Person} {prop : Elements.Property} {c : ComplaintText}
    (h : Elements.Section1963 p prop c) :
    Ontology.ForfeitableInterestMembership (mapElemProp_toOntoInt prop) p c :=
  ⟨corr_propNexus_toForfeitableInterest h.property,
   corr_convicted_toOntoViolation h.conviction⟩









axiom corr_deonViolated_toIncorporation {p c} :
    Deontic.ViolatedSection1962 p c →
    Structure.IncorporationHonored Structure.edge_1963_incorporates_1962 c





theorem s1963_deontic_implies_structure_modulo_gaps
    {p : Person} {pr : Deontic.Property} {c : ComplaintText}
    (h : Deontic.Obligation1963a p pr c)
    (gap_exceptionChannel :
      Structure.ExceptionApplies Structure.edge_1963i_exceptAsProvided_1963l c)
    (gap_treasuryOverride :
      Structure.OverrideTriggered Structure.edge_1963f_notwithstanding_31_3302b c)
    (gap_override31Exists :
      Structure.ReferencedSectionExists Structure.edge_1963f_notwithstanding_31_3302b c) :
    Structure.Coherent1963 c :=
  ⟨corr_deonViolated_toIncorporation h.addressee,
   gap_exceptionChannel, gap_treasuryOverride, gap_override31Exists⟩













axiom corr_elemInjury_toDeon {p c} :
    Elements.InjuredInBusinessOrProperty p c → Deontic.InjuredByViolation p c
axiom corr_elemSecBar_toDeon {p c} :
    Elements.SecuritiesFraudBar p c → Deontic.SecuritiesFraudBarInapplicable p c
axiom corr_elemInjury_toOnto {p c} :
    Elements.InjuredInBusinessOrProperty p c → Ontology.IsInjuredPerson p c
axiom corr_elemViolation_toOnto {p c} :
    Elements.ViolationOfSection1962 p c → Ontology.IsSection1962Violation p c



theorem s1964c_elements_implies_deontic
    {p : Person} {c : ComplaintText} (h : Elements.Section1964c p c) :
    Deontic.Permission1964c p c :=
  ⟨corr_elemInjury_toDeon h.injury, corr_elemSecBar_toDeon h.notSecBarred⟩



theorem s1964c_elements_implies_ontology
    {p : Person} {c : ComplaintText} (h : Elements.Section1964c p c) :
    Ontology.InjuredPersonMembership p c :=
  ⟨corr_elemInjury_toOnto h.injury, corr_elemViolation_toOnto h.violation⟩








axiom corr_elemViolation_toProcViaJurisdiction {p c} :
    Elements.ViolationOfSection1962 p c → Procedure.DistrictCourtJurisdiction c





theorem s1964c_elements_implies_procedure_modulo_gaps
    {p : Person} {c : ComplaintText}
    (h : Elements.Section1964c p c)
    (gap_filed   : Procedure.PrivateCivilSuitFiled p c)
    (gap_accrued : Procedure.CivilClaimAccrued p c)
    (gap_window  : Procedure.WithinLimitationsWindow p c)
    (gap_venue   : Procedure.VenueProper p c) :
    Procedure.TimelyCivilAction p c :=
  ⟨corr_elemViolation_toProcViaJurisdiction h.violation,
   gap_filed, gap_accrued, gap_window, gap_venue⟩



axiom corr_deonRemedialPower_toIncorp {c} :
    Deontic.RemedialPowerInvoked c →
    Structure.IncorporationHonored Structure.edge_1964_incorporates_1962 c





theorem s1964_deontic_implies_structure_modulo_gaps
    {c : ComplaintText}
    (h : Deontic.RemedialPowerInvoked c)
    (gap_section1962Exists :
      Structure.ReferencedSectionExists Structure.edge_1964_incorporates_1962 c) :
    Structure.Coherent1964 c :=
  ⟨corr_deonRemedialPower_toIncorp h, gap_section1962Exists⟩











axiom corr_elemVenue_toDeon {p c} :
    Elements.ProperVenue p c → Deontic.VenueProper p c
axiom corr_elemVenue_toOnto {p c} :
    Elements.ProperVenue p c → Ontology.HasVenueNexus p c
axiom corr_elemVenue_toProc {p c} :
    Elements.ProperVenue p c → Procedure.VenueProper p c


theorem s1965_elements_implies_deontic
    {p : Person} {c : ComplaintText} (h : Elements.ProperVenue p c) :
    Deontic.Permission1965aAvailable p c :=
  corr_elemVenue_toDeon h


theorem s1965_elements_implies_ontology
    {p : Person} {c : ComplaintText} (h : Elements.ProperVenue p c) :
    Ontology.VenueMembership p c :=
  ⟨corr_elemVenue_toOnto h⟩


theorem s1965_elements_implies_procedure
    {p : Person} {c : ComplaintText} (h : Elements.ProperVenue p c) :
    Procedure.VenueProper p c :=
  corr_elemVenue_toProc h





















axiom mapPerson    : Person        → Proving.Rico.Person
axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText

axiom corr_gold_injury {p c} :
    Elements.InjuredInBusinessOrProperty p c →
    Proving.Rico.BusinessOrPropertyInjury (mapPerson p) (mapComplaint c)
axiom corr_gold_causation {p c} {acts : List Proving.Rico.Act} :
    ProximateCause p c →
    Proving.Rico.ProximateCause (mapPerson p) acts (mapComplaint c)
axiom corr_gold_timely {p c} :
    WithinLimitations p c →
    Proving.Rico.WithinFourYearLimitationsPeriod (mapPerson p) (mapComplaint c)









theorem s1964c_standing_implies_golden_modulo_gaps
    {pl defendant : Person} {e : Proving.Rico.Entity}
    {acts : List Proving.Rico.Act} {c : ComplaintText}
    (h : Elements.Section1964c pl c)
    (gap_goldenViolation :
      Proving.Rico.Section1962c (mapPerson defendant) e acts (mapComplaint c)) :
    Proving.Rico.ValidCivilRicoComplaint1962c
      (mapPerson pl) (mapPerson defendant) e acts (mapComplaint c) :=
  ⟨gap_goldenViolation,
   corr_gold_injury h.injury,
   corr_gold_causation h.byReasonOf,
   corr_gold_timely h.timely⟩

end Proving.USC.T18.Enf.Bridge
