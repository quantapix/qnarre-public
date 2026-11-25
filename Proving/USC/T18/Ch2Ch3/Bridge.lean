
























import Proving.USC.T18.Ch2Ch3.Elements.Statute
import Proving.USC.T18.Ch2Ch3.Deontic.Statute
import Proving.USC.T18.Ch2Ch3.Scienter.Statute
import Proving.USC.T18.Ch2Ch3.Ontology.Statute
import Proving.Rico.Predicates
set_option autoImplicit false

namespace Proving.USC.T18.Ch2Ch3.Bridge
open Proving.USC.Common






axiom corr_addr32 {p : Person} {ac : Elements.Aircraft} {f : Elements.AirNavFacility}
    {c : ComplaintText} : Elements.Section32Violation p ac f c → Deontic.AddresseeInClass32 p c
axiom corr_cond32 {p : Person} {ac : Elements.Aircraft} {f : Elements.AirNavFacility}
    {c : ComplaintText} : Elements.Section32Violation p ac f c → Deontic.ConditionMet32 c
axiom corr_act32 {p : Person} {ac : Elements.Aircraft} {f : Elements.AirNavFacility}
    {c : ComplaintText} : Elements.Section32Violation p ac f c → Deontic.ProhibitedActOccurred32 p c

theorem s32_elements_implies_deontic {p : Person} {ac : Elements.Aircraft}
    {f : Elements.AirNavFacility} {c : ComplaintText}
    (h : Elements.Section32Violation p ac f c) : Deontic.ProhibitionViolated32 p c :=
  ⟨⟨corr_addr32 h, corr_cond32 h⟩, corr_act32 h⟩


axiom corr_sc32 {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Scienter.Scienter32Culpable p c

theorem s32_elements_implies_scienter {p : Person} {ac : Elements.Aircraft}
    {f : Elements.AirNavFacility} {c : ComplaintText}
    (h : Elements.Section32aOffense p ac f c) : Scienter.Scienter32Culpable p c :=
  corr_sc32 h.scienter


axiom corr_dsc32 {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated32 p c → Scienter.Scienter32Culpable p c

theorem s32_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated32 p c) : Scienter.Scienter32Culpable p c :=
  corr_dsc32 h





axiom corr_addr36 {p : Person} {c : ComplaintText} :
    Elements.Section36Violation p c → Deontic.AddresseeInClass36 p c
axiom corr_cond36 {p : Person} {c : ComplaintText} :
    Elements.Section36Violation p c → Deontic.ConditionMet36 c
axiom corr_act36 {p : Person} {c : ComplaintText} :
    Elements.Section36Violation p c → Deontic.ProhibitedActOccurred36 p c

theorem s36_elements_implies_deontic {p : Person} {c : ComplaintText}
    (h : Elements.Section36Violation p c) : Deontic.ProhibitionViolated36 p c :=
  ⟨⟨corr_addr36 h, corr_cond36 h⟩, corr_act36 h⟩


axiom corr_sc36 {p : Person} {c : ComplaintText} :
    Elements.IntentToIntimidateOrInjure p c → Scienter.Scienter36Culpable p c

theorem s36_elements_implies_scienter {p : Person} {c : ComplaintText}
    (h : Elements.Section36DriveBy p c) : Scienter.Scienter36Culpable p c :=
  corr_sc36 h.intent

axiom corr_dsc36 {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated36 p c → Scienter.Scienter36Culpable p c

theorem s36_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated36 p c) : Scienter.Scienter36Culpable p c :=
  corr_dsc36 h


axiom mapOffense36 : Person → Ontology.Offense
axiom corr_ont36 {p : Person} {c : ComplaintText} :
    Elements.InFurtheranceOfMajorDrugOffense p c → Ontology.MajorDrugOffenseDef (mapOffense36 p) c

theorem s36_elements_implies_ontology {p : Person} {c : ComplaintText}
    (h : Elements.Section36DriveBy p c) : Ontology.MajorDrugOffenseDef (mapOffense36 p) c :=
  corr_ont36 h.drugNexus





axiom corr_addr37 {p : Person} {ap : Elements.Airport} {c : ComplaintText} :
    Elements.Section37Offense p ap c → Deontic.AddresseeInClass37 p c
axiom corr_cond37 {p : Person} {ap : Elements.Airport} {c : ComplaintText} :
    Elements.Section37Offense p ap c → Deontic.ConditionMet37 c
axiom corr_act37 {p : Person} {ap : Elements.Airport} {c : ComplaintText} :
    Elements.Section37Offense p ap c → Deontic.ProhibitedActOccurred37 p c

theorem s37_elements_implies_deontic {p : Person} {ap : Elements.Airport} {c : ComplaintText}
    (h : Elements.Section37Offense p ap c) : Deontic.ProhibitionViolated37 p c :=
  ⟨⟨corr_addr37 h, corr_cond37 h⟩, corr_act37 h⟩

axiom corr_sc37 {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Scienter.Scienter37Culpable p c

theorem s37_elements_implies_scienter {p : Person} {ap : Elements.Airport} {c : ComplaintText}
    (h : Elements.Section37Offense p ap c) : Scienter.Scienter37Culpable p c :=
  corr_sc37 h.scienter

axiom corr_dsc37 {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated37 p c → Scienter.Scienter37Culpable p c

theorem s37_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated37 p c) : Scienter.Scienter37Culpable p c :=
  corr_dsc37 h





axiom corr_addr38 {p : Person} {part : Elements.AircraftPart} {c : ComplaintText} :
    Elements.Section38Offense p part c → Deontic.AddresseeInClass38 p c
axiom corr_cond38 {p : Person} {part : Elements.AircraftPart} {c : ComplaintText} :
    Elements.Section38Offense p part c → Deontic.ConditionMet38 c
axiom corr_comm38 {p : Person} {part : Elements.AircraftPart} {c : ComplaintText} :
    Elements.Section38Offense p part c → Deontic.AffectsInterstateCommerce c
axiom corr_act38 {p : Person} {part : Elements.AircraftPart} {c : ComplaintText} :
    Elements.Section38Offense p part c → Deontic.ProhibitedActOccurred38 p c

theorem s38_elements_implies_deontic {p : Person} {part : Elements.AircraftPart}
    {c : ComplaintText} (h : Elements.Section38Offense p part c) :
    Deontic.ProhibitionViolated38 p c :=
  ⟨⟨corr_addr38 h, corr_cond38 h, corr_comm38 h⟩, corr_act38 h⟩

axiom corr_sc38 {p : Person} {c : ComplaintText} :
    Elements.IntentToDefraud p c → Scienter.Scienter38Culpable p c

theorem s38_elements_implies_scienter {p : Person} {part : Elements.AircraftPart}
    {c : ComplaintText} (h : Elements.Section38Offense p part c) :
    Scienter.Scienter38Culpable p c :=
  corr_sc38 h.intentFraud

axiom corr_dsc38 {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated38 p c → Scienter.Scienter38Culpable p c

theorem s38_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated38 p c) : Scienter.Scienter38Culpable p c :=
  corr_dsc38 h





axiom corr_addr39B {p : Person} {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.Section39BViolation p ua c → Deontic.AddresseeInClass39B p c
axiom corr_cond39B {p : Person} {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.Section39BViolation p ua c → Deontic.ConditionMet39B c
axiom corr_act39B {p : Person} {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.Section39BViolation p ua c → Deontic.ProhibitedActOccurred39B p c

theorem s39B_elements_implies_deontic {p : Person} {ua : Elements.UnmannedAircraft}
    {c : ComplaintText} (h : Elements.Section39BViolation p ua c) :
    Deontic.ProhibitionViolated39B p c :=
  ⟨⟨corr_addr39B h, corr_cond39B h⟩, corr_act39B h⟩


axiom corr_sc39B {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Scienter.Scienter39Ba1Culpable p c

theorem s39B_elements_implies_scienter {p : Person} {ua : Elements.UnmannedAircraft}
    {c : ComplaintText} (h : Elements.Section39BInterference p ua c) :
    Scienter.Scienter39Ba1Culpable p c :=
  corr_sc39B h.scienter

axiom corr_dsc39B {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated39B p c → Scienter.Scienter39Ba1Culpable p c

theorem s39B_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated39B p c) : Scienter.Scienter39Ba1Culpable p c :=
  corr_dsc39B h


axiom mapZone39B : Elements.UnmannedAircraft → Ontology.RunwayExclusionZone
axiom corr_ont39B {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.OperatesInRunwayExclusionZone ua c → Ontology.RunwayExclusionZoneDef (mapZone39B ua) c

theorem s39B_elements_implies_ontology {p : Person} {ua : Elements.UnmannedAircraft}
    {c : ComplaintText} (h : Elements.Section39BRunwayZone p ua c) :
    Ontology.RunwayExclusionZoneDef (mapZone39B ua) c :=
  corr_ont39B h.zone





axiom corr_addr40A {p : Person} {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.Section40AOffense p ua c → Deontic.AddresseeInClass40A p c
axiom corr_cond40A {p : Person} {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.Section40AOffense p ua c → Deontic.ConditionMet40A c
axiom corr_act40A {p : Person} {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.Section40AOffense p ua c → Deontic.ProhibitedActOccurred40A p c

theorem s40A_elements_implies_deontic {p : Person} {ua : Elements.UnmannedAircraft}
    {c : ComplaintText} (h : Elements.Section40AOffense p ua c) :
    Deontic.ProhibitionViolated40A p c :=
  ⟨⟨corr_addr40A h, corr_cond40A h⟩, corr_act40A h⟩


axiom corr_sc40A {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Scienter.Scienter40ACulpable p c

theorem s40A_elements_implies_scienter {p : Person} {ua : Elements.UnmannedAircraft}
    {c : ComplaintText} (h : Elements.Section40AOffense p ua c) :
    Scienter.Scienter40ACulpable p c :=
  corr_sc40A h.scienter

axiom corr_dsc40A {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated40A p c → Scienter.Scienter40ACulpable p c

theorem s40A_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated40A p c) : Scienter.Scienter40ACulpable p c :=
  corr_dsc40A h


axiom mapSuppression40A : Elements.UnmannedAircraft → Ontology.SuppressionEffort
axiom mapWildfire40A : Elements.UnmannedAircraft → Ontology.Wildfire
axiom corr_ont40A {ua : Elements.UnmannedAircraft} {c : ComplaintText} :
    Elements.InterferesWithWildfireSuppression ua c →
      Ontology.WildfireSuppressionDef (mapSuppression40A ua) (mapWildfire40A ua) c

theorem s40A_elements_implies_ontology {p : Person} {ua : Elements.UnmannedAircraft}
    {c : ComplaintText} (h : Elements.Section40AOffense p ua c) :
    Ontology.WildfireSuppressionDef (mapSuppression40A ua) (mapWildfire40A ua) c :=
  corr_ont40A h.interferes





axiom corr_addr42 {p : Person} {sp : Elements.InjuriousSpecies} {c : ComplaintText} :
    Elements.Section42Violation p sp c → Deontic.AddresseeInClass42 p c
axiom corr_cond42 {p : Person} {sp : Elements.InjuriousSpecies} {c : ComplaintText} :
    Elements.Section42Violation p sp c → Deontic.ConditionMet42 c
axiom corr_act42 {p : Person} {sp : Elements.InjuriousSpecies} {c : ComplaintText} :
    Elements.Section42Violation p sp c → Deontic.ProhibitedActOccurred42 p c

theorem s42_elements_implies_deontic {p : Person} {sp : Elements.InjuriousSpecies}
    {c : ComplaintText} (h : Elements.Section42Violation p sp c) :
    Deontic.ProhibitionViolated42 p c :=
  ⟨⟨corr_addr42 h, corr_cond42 h⟩, corr_act42 h⟩




axiom corr_sc42c {p : Person} {c : ComplaintText} :
    ActedWithScienter p c → Scienter.Scienter42cCulpable p c

theorem s42_elements_implies_scienter {p : Person} {sp : Elements.InjuriousSpecies}
    {c : ComplaintText} (h : Elements.Section42InhumaneTransport p sp c) :
    Scienter.Scienter42cCulpable p c :=
  corr_sc42c h.scienter


axiom mapCreature42 : Elements.InjuriousSpecies → Ontology.Creature
axiom corr_ont42 {sp : Elements.InjuriousSpecies} {c : ComplaintText} :
    Elements.IsWildAnimalOrBird sp c → Ontology.IsWild (mapCreature42 sp) c

theorem s42_elements_implies_ontology {p : Person} {sp : Elements.InjuriousSpecies}
    {c : ComplaintText} (h : Elements.Section42InhumaneTransport p sp c) :
    Ontology.IsWild (mapCreature42 sp) c :=
  corr_ont42 h.wild





axiom corr_addr43 {p : Person} {ae : Elements.AnimalEnterprise} {c : ComplaintText} :
    Elements.Section43Offense p ae c → Deontic.AddresseeInClass43 p c
axiom corr_cond43 {p : Person} {ae : Elements.AnimalEnterprise} {c : ComplaintText} :
    Elements.Section43Offense p ae c → Deontic.ConditionMet43 c
axiom corr_comm43 {p : Person} {ae : Elements.AnimalEnterprise} {c : ComplaintText} :
    Elements.Section43Offense p ae c → Deontic.AffectsInterstateCommerce c
axiom corr_act43 {p : Person} {ae : Elements.AnimalEnterprise} {c : ComplaintText} :
    Elements.Section43Offense p ae c → Deontic.ProhibitedActOccurred43 p c

theorem s43_elements_implies_deontic {p : Person} {ae : Elements.AnimalEnterprise}
    {c : ComplaintText} (h : Elements.Section43Offense p ae c) :
    Deontic.ProhibitionViolated43 p c :=
  ⟨⟨corr_addr43 h, corr_cond43 h, corr_comm43 h⟩, corr_act43 h⟩


axiom corr_sc43 {p : Person} {c : ComplaintText} :
    Elements.PurposeToDamageAnimalEnterprise p c → Scienter.Scienter43Culpable p c

theorem s43_elements_implies_scienter {p : Person} {ae : Elements.AnimalEnterprise}
    {c : ComplaintText} (h : Elements.Section43Offense p ae c) :
    Scienter.Scienter43Culpable p c :=
  corr_sc43 h.purpose

axiom corr_dsc43 {p : Person} {c : ComplaintText} :
    Deontic.ProhibitionViolated43 p c → Scienter.Scienter43Culpable p c

theorem s43_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated43 p c) : Scienter.Scienter43Culpable p c :=
  corr_dsc43 h


axiom mapEntity43 : Elements.AnimalEnterprise → Entity
axiom corr_ont43 {ae : Elements.AnimalEnterprise} {c : ComplaintText} :
    Elements.IsAnimalEnterprise ae c → Ontology.AnimalEnterpriseDef (mapEntity43 ae) c

theorem s43_elements_implies_ontology {p : Person} {ae : Elements.AnimalEnterprise}
    {c : ComplaintText} (h : Elements.Section43Offense p ae c) :
    Ontology.AnimalEnterpriseDef (mapEntity43 ae) c :=
  corr_ont43 h.enterprise









axiom mapComplaintRico : ComplaintText → Proving.Rico.ComplaintText


axiom actWitness32 : ∀ {p : Person} {ac : Elements.Aircraft} {f : Elements.AirNavFacility}
    {c : ComplaintText}, Elements.Section32Violation p ac f c → Proving.Rico.Act
axiom corr_ra32 : ∀ {p : Person} {ac : Elements.Aircraft} {f : Elements.AirNavFacility}
    {c : ComplaintText} (h : Elements.Section32Violation p ac f c),
    Proving.Rico.IsRacketeeringActivity (actWitness32 h) (mapComplaintRico c)



theorem s32_elements_implies_golden_ra {p : Person} {ac : Elements.Aircraft}
    {f : Elements.AirNavFacility} {c : ComplaintText}
    (h : Elements.Section32Violation p ac f c) :
    Proving.Rico.IsRacketeeringActivity (actWitness32 h) (mapComplaintRico c) :=
  corr_ra32 h


axiom actWitness37 : ∀ {p : Person} {ap : Elements.Airport} {c : ComplaintText},
    Elements.Section37Offense p ap c → Proving.Rico.Act
axiom corr_ra37 : ∀ {p : Person} {ap : Elements.Airport} {c : ComplaintText}
    (h : Elements.Section37Offense p ap c),
    Proving.Rico.IsRacketeeringActivity (actWitness37 h) (mapComplaintRico c)



theorem s37_elements_implies_golden_ra {p : Person} {ap : Elements.Airport}
    {c : ComplaintText} (h : Elements.Section37Offense p ap c) :
    Proving.Rico.IsRacketeeringActivity (actWitness37 h) (mapComplaintRico c) :=
  corr_ra37 h

end Proving.USC.T18.Ch2Ch3.Bridge
