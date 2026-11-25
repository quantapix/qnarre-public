

































































import Proving.USC.T18.Ch73.Reslice.Bridge
import Proving.USC.T18.Ch73.Reslice.GoldenBridge

set_option autoImplicit false

namespace Proving.USC.Reconciled

open Proving.USC.Common (Person Agreement ComplaintText)
open Proving.USC.T18.Ch73.Reslice










abbrev Section1512Offense := @Elements.Section1512Offense




abbrev ValidSection1512Prosecution := @Elements.ValidSection1512Prosecution




abbrev Section1512OffenseDeontic := @Deontic.Section1512Offense





abbrev Section1512ScienterLiable := @Scienter.Section1512ScienterLiable



abbrev VenueProper1512i := @Elements.VenueProper












abbrev IsOfficialProceeding1515a1 := @Ontology.OfficialProceedingMembership



abbrev IsPhysicalForce1515a2 := @Ontology.PhysicalForceMembership




abbrev IsMisleadingConduct1515a3 := @Ontology.MisleadingConductMembership



abbrev IsLawEnforcementOfficer1515a4 := @Ontology.LawEnforcementOfficerMembership





abbrev IsBodilyInjury1515a5 := @Ontology.BodilyInjuryMembership



abbrev IsCorruptlyPersuades1515a6 := @Ontology.CorruptlyPersuadesMembership



abbrev IsCorruptly1515b1505 := @Ontology.CorruptlyMembership




abbrev LawfulRepresentationCarveOut1515c := @Ontology.LawfulRepresentationCarveOut









abbrev Corruptly1512Undefined := @Ontology.IsCorruptlyAsUsedInSection1512








theorem s1512_is_rico_predicate_act {d v : Person} {r : Elements.RecordOrObject}
    {pr : Elements.OfficialProceeding} {o : Person} {ag : Agreement} {c : ComplaintText}
    (a : GoldenBridge.Act) (h : Elements.Section1512Offense d v r pr o ag c) :
    Proving.Rico.IsRacketeeringActivity (GoldenBridge.mapAct a) (GoldenBridge.mapComplaint c) :=
  GoldenBridge.s1512_elements_implies_rico_1961B a h

end Proving.USC.Reconciled
