





































import Proving.USC.T18.Ch77Tail.Elements.Statute
import Proving.USC.T18.Ch77Tail.Deontic.Statute
import Proving.USC.T18.Ch77Tail.Ontology.Statute
import Proving.USC.T18.Ch77Tail.Scienter.Statute
import Proving.USC.Common.Types

namespace Proving.USC.T18.Ch77Tail.Bridge

open Proving.USC.Common
open Proving.USC.T18.Ch77Tail










axiom corr_d_addr1582 {p : Person} {c : ComplaintText} {ve : Elements.Vessel} :
    Elements.PreparesOrDispatchesSlaveVessel p ve c → Deontic.AddresseeInClass1582 p c
axiom corr_d_cond1582 {p : Person} {c : ComplaintText} :
    Elements.PurposeToProcureForSlavery p c → Deontic.ConditionMet1582 p c
axiom corr_d_act1582 {p : Person} {c : ComplaintText} {ve : Elements.Vessel} {vd : Deontic.Vessel} :
    Elements.PreparesOrDispatchesSlaveVessel p ve c → Deontic.RegulatedActOccurred1582 p vd c


theorem s1582_elements_implies_deontic
    {p : Person} {c : ComplaintText} {ve : Elements.Vessel} {vd : Deontic.Vessel}
    (h : Elements.Section1582 p ve c) : Deontic.ProhibitionViolated1582 p vd c :=
  ⟨⟨corr_d_addr1582 h.prepares, corr_d_cond1582 h.purpose⟩, corr_d_act1582 h.prepares⟩


axiom corr_d_addr1585 {p : Person} {c : ComplaintText} :
    Elements.IsCrewOfSlaveTradeVessel p c → Deontic.AddresseeInClass1585 p c
axiom corr_d_cond1585 {p : Person} {c : ComplaintText} :
    Elements.IntentToEnslave p c → Deontic.ConditionMet1585 p c
axiom corr_d_act1585 {p victim : Person} {c : ComplaintText} {vd : Deontic.Vessel} :
    Elements.SeizesOrTransportsPersonAsSlave p victim c → Deontic.RegulatedActOccurred1585 p vd c


theorem s1585_elements_implies_deontic
    {p victim : Person} {c : ComplaintText} {vd : Deontic.Vessel}
    (h : Elements.Section1585 p victim c) : Deontic.ProhibitionViolated1585 p vd c :=
  ⟨⟨corr_d_addr1585 h.crew, corr_d_cond1585 h.intent⟩, corr_d_act1585 h.act⟩


axiom corr_d_addr1586 {p : Person} {c : ComplaintText} :
    Elements.IsUSCitizenOrResident p c → Deontic.AddresseeInClass1586 p c
axiom corr_d_cond1586 {p : Person} {c : ComplaintText} {ve : Elements.Vessel} {vd : Deontic.Vessel} :
    Elements.VoluntarilyServesOnSlaveTransportVessel p ve c → Deontic.ConditionMet1586 p vd c
axiom corr_d_act1586 {p : Person} {c : ComplaintText} {ve : Elements.Vessel} {vd : Deontic.Vessel} :
    Elements.VoluntarilyServesOnSlaveTransportVessel p ve c → Deontic.RegulatedActOccurred1586 p vd c


theorem s1586_elements_implies_deontic
    {p : Person} {c : ComplaintText} {ve : Elements.Vessel} {vd : Deontic.Vessel}
    (h : Elements.Section1586 p ve c) : Deontic.ProhibitionViolated1586 p vd c :=
  ⟨⟨corr_d_addr1586 h.citizen, corr_d_cond1586 h.serves⟩, corr_d_act1586 h.serves⟩


axiom corr_d_addr1587 {p : Person} {c : ComplaintText} {vd : Deontic.Vessel} :
    Elements.IsVesselCommander p c → Deontic.AddresseeInClass1587 p vd c
axiom corr_d_cond1587 {p victim : Person} {c : ComplaintText} :
    Elements.PossessesPersonForSaleAsSlave p victim c → Deontic.ConditionMet1587 p c
axiom corr_d_act1587 {p victim : Person} {c : ComplaintText} {vd : Deontic.Vessel} :
    Elements.PossessesPersonForSaleAsSlave p victim c → Deontic.RegulatedActOccurred1587 p vd c


theorem s1587_elements_implies_deontic
    {p victim : Person} {c : ComplaintText} {ve : Elements.Vessel} {vd : Deontic.Vessel}
    (h : Elements.Section1587 p ve victim c) : Deontic.ProhibitionViolated1587 p vd c :=
  ⟨⟨corr_d_addr1587 h.commander, corr_d_cond1587 h.possesses⟩, corr_d_act1587 h.possesses⟩


axiom corr_d_addr1588 {p : Person} {c : ComplaintText} {vd : Deontic.Vessel} :
    Elements.IsVesselMasterOwnerOrInCharge p c → Deontic.AddresseeInClass1588 p vd c
axiom corr_d_cond1588 {p : Person} {c : ComplaintText} :
    Elements.KnowledgeOrIntentToHoldOrSellAsSlave p c → Deontic.ConditionMet1588 p c
axiom corr_d_act1588 {p victim : Person} {c : ComplaintText} {vd : Deontic.Vessel} :
    Elements.ReceivesOrCarriesPersonFromUS p victim c → Deontic.RegulatedActOccurred1588 p vd c


theorem s1588_elements_implies_deontic
    {p victim : Person} {c : ComplaintText} {vd : Deontic.Vessel}
    (h : Elements.Section1588 p victim c) : Deontic.ProhibitionViolated1588 p vd c :=
  ⟨⟨corr_d_addr1588 h.charge, corr_d_cond1588 h.scienter⟩, corr_d_act1588 h.act⟩


axiom corr_d_addr1592 {p : Person} {c : ComplaintText} {de : Elements.Document} :
    Elements.KnowinglyHandlesIdentityDocument p de c → Deontic.AddresseeInClass1592 p c
axiom corr_d_cond1592 {p : Person} {c : ComplaintText} :
    Elements.TraffickingDocumentNexus p c → Deontic.ConditionMet1592 p c
axiom corr_d_act1592 {p : Person} {c : ComplaintText} {de : Elements.Document} {dd : Deontic.Document} :
    Elements.KnowinglyHandlesIdentityDocument p de c → Deontic.RegulatedActOccurred1592 p dd c


axiom corr_d_victim1592 {p : Person} {c : ComplaintText} :
    Deontic.VictimException1592 p c → Elements.VictimOwnConductException p c



theorem s1592a_elements_implies_deontic
    {p : Person} {c : ComplaintText} {de : Elements.Document} {dd : Deontic.Document}
    (h : Elements.Section1592a p de c) : Deontic.ProhibitionViolated1592 p dd c :=
  ⟨⟨corr_d_addr1592 h.handles, corr_d_cond1592 h.nexus⟩,
   corr_d_act1592 h.handles,
   fun hd => h.notVictim (corr_d_victim1592 hd)⟩

axiom corr_d_addr1592c {p : Person} {c : ComplaintText} :
    Elements.ObstructsEnforcement p c → Deontic.AddresseeInClass1592c p c
axiom corr_d_act1592c {p : Person} {c : ComplaintText} :
    Elements.ObstructsEnforcement p c → Deontic.RegulatedActOccurred1592c p c



theorem s1592c_elements_implies_deontic
    {p : Person} {c : ComplaintText}
    (h : Elements.Section1592c p c) : Deontic.ProhibitionViolated1592c p c :=
  ⟨⟨corr_d_addr1592c h.obstructs⟩, corr_d_act1592c h.obstructs⟩












axiom corr_s1582 {p : Person} {c : ComplaintText} :
    Elements.PurposeToProcureForSlavery p c → Scienter.Culpable1582 p c
axiom corr_s1585 {p : Person} {c : ComplaintText} :
    Elements.IntentToEnslave p c → Scienter.Culpable1585 p c
axiom corr_s1587 {p victim : Person} {c : ComplaintText} :
    Elements.PossessesPersonForSaleAsSlave p victim c → Scienter.Culpable1587 p c
axiom corr_s1588 {p : Person} {c : ComplaintText} :
    Elements.KnowledgeOrIntentToHoldOrSellAsSlave p c → Scienter.Culpable1588 p c
axiom corr_s1592 {p : Person} {c : ComplaintText} {de : Elements.Document} :
    Elements.KnowinglyHandlesIdentityDocument p de c → Scienter.Culpable1592 p c


theorem s1582_elements_implies_scienter
    {p : Person} {c : ComplaintText} {ve : Elements.Vessel}
    (h : Elements.Section1582 p ve c) : Scienter.Culpable1582 p c :=
  corr_s1582 h.purpose


theorem s1585_elements_implies_scienter
    {p victim : Person} {c : ComplaintText}
    (h : Elements.Section1585 p victim c) : Scienter.Culpable1585 p c :=
  corr_s1585 h.intent


theorem s1587_elements_implies_scienter
    {p victim : Person} {c : ComplaintText} {ve : Elements.Vessel}
    (h : Elements.Section1587 p ve victim c) : Scienter.Culpable1587 p c :=
  corr_s1587 h.possesses


theorem s1588_elements_implies_scienter
    {p victim : Person} {c : ComplaintText}
    (h : Elements.Section1588 p victim c) : Scienter.Culpable1588 p c :=
  corr_s1588 h.scienter


theorem s1592_elements_implies_scienter
    {p : Person} {c : ComplaintText} {de : Elements.Document}
    (h : Elements.Section1592a p de c) : Scienter.Culpable1592 p c :=
  corr_s1592 h.handles







theorem s1586_elements_implies_scienter_modulo_gaps
    {p : Person} {c : ComplaintText} {ve : Elements.Vessel}
    (_h : Elements.Section1586 p ve c)
    (gap_scienter1586 : Scienter.MentalStateProven p MentalState.Knowledge c) :
    Scienter.Culpable1586 p c :=
  ⟨MentalState.Knowledge, MentalState.atLeast_refl _, gap_scienter1586⟩











axiom corr_o1582 {p : Person} {c : ComplaintText} {ve : Elements.Vessel} :
    Elements.PreparesOrDispatchesSlaveVessel p ve c → Ontology.IsMasterFactorOrOwner p c
axiom corr_o1585 {p : Person} {c : ComplaintText} :
    Elements.IsCrewOfSlaveTradeVessel p c → Ontology.IsCrewMember p c
axiom corr_o1586 {p : Person} {c : ComplaintText} :
    Elements.IsUSCitizenOrResident p c → Ontology.IsCitizenOrResidentOfUS p c
axiom corr_o1587 {p : Person} {c : ComplaintText} :
    Elements.IsVesselCommander p c → Ontology.IsCaptainMasterOrCommander p c
axiom corr_o1588 {p : Person} {c : ComplaintText} :
    Elements.IsVesselMasterOwnerOrInCharge p c → Ontology.IsMasterOwnerOrPersonInCharge p c


theorem s1582_elements_implies_ontology
    {p : Person} {c : ComplaintText} {ve : Elements.Vessel}
    (h : Elements.Section1582 p ve c) : Ontology.VesselSlaveTradeRole p c :=
  .masterFactorOwner (corr_o1582 h.prepares)


theorem s1585_elements_implies_ontology
    {p victim : Person} {c : ComplaintText}
    (h : Elements.Section1585 p victim c) : Ontology.VesselSlaveTradeRole p c :=
  .crewMember (corr_o1585 h.crew)


theorem s1586_elements_implies_ontology
    {p : Person} {c : ComplaintText} {ve : Elements.Vessel}
    (h : Elements.Section1586 p ve c) : Ontology.IsCitizenOrResidentOfUS p c :=
  corr_o1586 h.citizen


theorem s1587_elements_implies_ontology
    {p victim : Person} {c : ComplaintText} {ve : Elements.Vessel}
    (h : Elements.Section1587 p ve victim c) : Ontology.VesselSlaveTradeRole p c :=
  .captainMasterCmdr (corr_o1587 h.commander)


theorem s1588_elements_implies_ontology
    {p victim : Person} {c : ComplaintText}
    (h : Elements.Section1588 p victim c) : Ontology.VesselSlaveTradeRole p c :=
  .masterOwnerInCharge (corr_o1588 h.charge)

axiom mapDocEO : Elements.Document → Ontology.Document
axiom corr_o_doc1592 {de : Elements.Document} {c : ComplaintText} :
    Elements.DocumentIsIdentityDocOfAnother de c →
    Ontology.IsImmigrationOrIdentityDocument (mapDocEO de) c






theorem s1592_elements_implies_ontology_modulo_gaps
    {p : Person} {c : ComplaintText} {de : Elements.Document}
    (h : Elements.Section1592a p de c)
    (gap_severeFormVictim1592 : Ontology.IsSevereFormOfTraffickingVictim p c) :
    Ontology.DocumentOffenseObjectMembership (mapDocEO de) p c :=
  ⟨corr_o_doc1592 h.document, gap_severeFormVictim1592⟩

end Proving.USC.T18.Ch77Tail.Bridge
