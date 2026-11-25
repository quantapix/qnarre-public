





































import Proving.USC.T42.SchoolDesegregation.Elements.Statute
import Proving.USC.T42.SchoolDesegregation.Deontic.Statute
import Proving.USC.T42.SchoolDesegregation.Ontology.Statute
import Proving.USC.T42.SchoolDesegregation.Procedure.Statute
import Proving.USC.T42.SchoolDesegregation.Structure.Statute

namespace Proving.USC.T42.SchoolDesegregation.Bridge
open Proving.USC.Common
open Proving.USC.T42.SchoolDesegregation


















axiom corr_6_d_addr {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {p : Person} {c : ComplaintText} :
    Elements.ReceivedSchoolBoardEqualProtectionComplaint wc s c ∨
      Elements.ReceivedPublicCollegeDenialComplaint wc s c →
    Deontic.AddresseeIsAttorneyGeneral p c

axiom corr_6_d_compl {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {c : ComplaintText} :
    Elements.ReceivedSchoolBoardEqualProtectionComplaint wc s c ∨
      Elements.ReceivedPublicCollegeDenialComplaint wc s c →
    Deontic.SignedWrittenComplaintReceived c


axiom corr_6_d_sat {wc : Elements.WrittenComplaint} {c : ComplaintText} :
    Elements.ComplaintIsWritingUnder1001 wc c →
    Elements.SignersUnableToMaintainProceedings wc c →
    Deontic.AGSatisfiedMeritAndInability c


axiom corr_6_d_act {s : Elements.PublicSchool} {p : Person} {c : ComplaintText} :
    Elements.SeeksDesegregationRelief s c → Deontic.AGInstitutedCivilAction p c




theorem s2000c6_schoolBoard_elements_implies_deontic
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {p : Person} {c : ComplaintText}
    (h : Elements.Section2000c6SchoolBoard wc s c) :
    Deontic.Power2000c6Exercised p c :=
  ⟨⟨corr_6_d_addr (Or.inl h.complaint),
    corr_6_d_compl (Or.inl h.complaint),
    corr_6_d_sat h.validWriting h.inability⟩,
   corr_6_d_act h.desegRelief⟩



theorem s2000c6_college_elements_implies_deontic
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {p : Person} {c : ComplaintText}
    (h : Elements.Section2000c6College wc s c) :
    Deontic.Power2000c6Exercised p c :=
  ⟨⟨corr_6_d_addr (Or.inr h.complaint),
    corr_6_d_compl (Or.inr h.complaint),
    corr_6_d_sat h.validWriting h.inability⟩,
   corr_6_d_act h.desegRelief⟩



theorem s2000c6_elements_implies_deontic
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {p : Person} {c : ComplaintText}
    (h : Elements.ValidAttorneyGeneralDesegregationAction wc s c) :
    Deontic.Power2000c6Exercised p c :=
  match h with
  | .schoolBoard hh => s2000c6_schoolBoard_elements_implies_deontic hh
  | .college hh => s2000c6_college_elements_implies_deontic hh








axiom corr_6_o_action {s : Elements.PublicSchool}
    {act : Ontology.AttorneyGeneralCivilAction} {c : ComplaintText} :
    Elements.SeeksDesegregationRelief s c → Ontology.IsAttorneyGeneralCivilAction act c
axiom corr_6_o_complaint {wc : Elements.WrittenComplaint}
    {w : Ontology.WrittenComplaintT42IV} {c : ComplaintText} :
    Elements.ComplaintIsWritingUnder1001 wc c → Ontology.IsWrittenComplaintT42IV w c


axiom corr_6_o_sb_parent {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {par : Ontology.ParentT42IV} {c : ComplaintText} :
    Elements.ReceivedSchoolBoardEqualProtectionComplaint wc s c →
    Ontology.IsParentT42IV par c
axiom corr_6_o_sb_class {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {cls : Ontology.SimilarlySituatedClass} {c : ComplaintText} :
    Elements.ReceivedSchoolBoardEqualProtectionComplaint wc s c →
    Ontology.IsSimilarlySituatedClass cls c
axiom corr_6_o_sb_board {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {sb : Ontology.SchoolBoard} {c : ComplaintText} :
    Elements.ReceivedSchoolBoardEqualProtectionComplaint wc s c →
    Ontology.IsSchoolBoard sb c

axiom corr_6_o_col_parent {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {par : Ontology.ParentT42IV} {c : ComplaintText} :
    Elements.ReceivedPublicCollegeDenialComplaint wc s c →
    Ontology.IsParentT42IV par c
axiom corr_6_o_col_college {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {pc : Ontology.PublicCollege} {c : ComplaintText} :
    Elements.ReceivedPublicCollegeDenialComplaint wc s c →
    Ontology.IsPublicCollege pc c




theorem s2000c6_schoolBoard_elements_implies_ontology
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool} {c : ComplaintText}
    {act : Ontology.AttorneyGeneralCivilAction} {w : Ontology.WrittenComplaintT42IV}
    {par : Ontology.ParentT42IV} {cls : Ontology.SimilarlySituatedClass}
    {sb : Ontology.SchoolBoard} {pc : Ontology.PublicCollege}
    (h : Elements.Section2000c6SchoolBoard wc s c) :
    Ontology.AGCivilActionMembership act w par cls sb pc c :=
  ⟨corr_6_o_action h.desegRelief,
   corr_6_o_complaint h.validWriting,
   .school ⟨corr_6_o_sb_parent h.complaint,
            corr_6_o_sb_class h.complaint,
            corr_6_o_sb_board h.complaint⟩⟩



theorem s2000c6_college_elements_implies_ontology
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool} {c : ComplaintText}
    {act : Ontology.AttorneyGeneralCivilAction} {w : Ontology.WrittenComplaintT42IV}
    {par : Ontology.ParentT42IV} {cls : Ontology.SimilarlySituatedClass}
    {sb : Ontology.SchoolBoard} {pc : Ontology.PublicCollege}
    (h : Elements.Section2000c6College wc s c) :
    Ontology.AGCivilActionMembership act w par cls sb pc c :=
  ⟨corr_6_o_action h.desegRelief,
   corr_6_o_complaint h.validWriting,
   .college ⟨corr_6_o_col_parent h.complaint,
             corr_6_o_col_college h.complaint⟩⟩



axiom corr_6_p_recv {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool}
    {sp : Person} {pw : Procedure.WrittenComplaint} {c : ComplaintText} :
    Elements.ReceivedSchoolBoardEqualProtectionComplaint wc s c ∨
      Elements.ReceivedPublicCollegeDenialComplaint wc s c →
    Procedure.WrittenComplaintReceived sp pw c
axiom corr_6_p_writing {wc : Elements.WrittenComplaint} {pw : Procedure.WrittenComplaint}
    {c : ComplaintText} :
    Elements.ComplaintIsWritingUnder1001 wc c → Procedure.ComplaintIsSection1001Writing pw c
axiom corr_6_p_inab {wc : Elements.WrittenComplaint} {sp : Person}
    {pw : Procedure.WrittenComplaint} {c : ComplaintText} :
    Elements.SignersUnableToMaintainProceedings wc c → Procedure.SignatoryUnableToMaintain sp pw c
axiom corr_6_p_inst {s : Elements.PublicSchool} {sp : Person}
    {pw : Procedure.WrittenComplaint} {c : ComplaintText} :
    Elements.SeeksDesegregationRelief s c → Procedure.AGInstitutedAction sp pw c



theorem s2000c6_schoolBoard_elements_implies_procedure
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool} {c : ComplaintText}
    {sp : Person} {pw : Procedure.WrittenComplaint}
    (h : Elements.Section2000c6SchoolBoard wc s c) :
    Procedure.AGActionTrackProper sp pw c :=
  ⟨corr_6_p_recv (Or.inl h.complaint),
   corr_6_p_writing h.validWriting,
   corr_6_p_inab h.inability,
   corr_6_p_inst h.desegRelief⟩


theorem s2000c6_college_elements_implies_procedure
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool} {c : ComplaintText}
    {sp : Person} {pw : Procedure.WrittenComplaint}
    (h : Elements.Section2000c6College wc s c) :
    Procedure.AGActionTrackProper sp pw c :=
  ⟨corr_6_p_recv (Or.inr h.complaint),
   corr_6_p_writing h.validWriting,
   corr_6_p_inab h.inability,
   corr_6_p_inst h.desegRelief⟩






axiom corr_6_s_exists {wc : Elements.WrittenComplaint} {c : ComplaintText} :
    Elements.ComplaintIsWritingUnder1001 wc c →
    Structure.ReferencedSectionExists Structure.edge_2000c6_incorporates_18s1001 c
axiom corr_6_s_honored {wc : Elements.WrittenComplaint} {c : ComplaintText} :
    Elements.ComplaintIsWritingUnder1001 wc c →
    Structure.IncorporationHonored Structure.edge_2000c6_incorporates_18s1001 c



theorem s2000c6_elements_implies_structure
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool} {c : ComplaintText}
    (h : Elements.Section2000c6SchoolBoard wc s c) :
    Structure.Coherent2000c6 c :=
  ⟨corr_6_s_exists h.validWriting, corr_6_s_honored h.validWriting⟩









axiom corr_8_d_addr {p : Person} {c : ComplaintText} :
    Elements.HasRightToSueForPublicEducationDiscrimination p c →
    Deontic.AddresseeIsAnyPerson p c
axiom corr_8_d_subj {p : Person} {c : ComplaintText} :
    Elements.HasRightToSueForPublicEducationDiscrimination p c →
    Deontic.DiscriminationInPublicEducation c


axiom corr_8_d_act {p : Person} {c : ComplaintText} :
    Elements.PrivateRightNotDisplaced p c → Deontic.PersonSuesForRelief p c



theorem s2000c8_elements_implies_deontic
    {p : Person} {c : ComplaintText}
    (h : Elements.Section2000c8 p c) :
    Deontic.Permission2000c8Exercised p c :=
  ⟨⟨corr_8_d_addr h.rightToSue, corr_8_d_subj h.rightToSue⟩,
   corr_8_d_act h.notDisplaced⟩



axiom corr_8_o_suit {p : Person} {s : Ontology.PersonalSuitForRelief} {c : ComplaintText} :
    Elements.HasRightToSueForPublicEducationDiscrimination p c →
    Ontology.IsPersonalSuitForRelief s c
axiom corr_8_o_preserved {p : Person} {c : ComplaintText} :
    Elements.PrivateRightNotDisplaced p c → Ontology.PreservesPrivateRight p c


theorem s2000c8_elements_implies_ontology
    {p : Person} {s : Ontology.PersonalSuitForRelief} {c : ComplaintText}
    (h : Elements.Section2000c8 p c) :
    Ontology.PersonalSuitMembership s p c :=
  ⟨corr_8_o_suit h.rightToSue, corr_8_o_preserved h.notDisplaced⟩



axiom corr_8_p_preserved {p : Person} {c : ComplaintText} :
    Elements.HasRightToSueForPublicEducationDiscrimination p c →
    Procedure.PrivateRightOfSuitPreserved p c
axiom corr_8_p_filed {p : Person} {c : ComplaintText} :
    Elements.PrivateRightNotDisplaced p c → Procedure.PrivateSuitFiled p c


theorem s2000c8_elements_implies_procedure
    {p : Person} {c : ComplaintText}
    (h : Elements.Section2000c8 p c) :
    Procedure.PrivateSuitTrackProper p c :=
  ⟨corr_8_p_preserved h.rightToSue, corr_8_p_filed h.notDisplaced⟩



axiom corr_8_s_exists {p : Person} {c : ComplaintText} :
    Elements.PrivateRightNotDisplaced p c →
    Structure.ReferencedSectionExists Structure.edge_2000c8_savings_subchapter c
axiom corr_8_s_savings {p : Person} {c : ComplaintText} :
    Elements.PrivateRightNotDisplaced p c →
    Structure.SavingsClausePreserved Structure.edge_2000c8_savings_subchapter c



theorem s2000c8_elements_implies_structure
    {p : Person} {c : ComplaintText}
    (h : Elements.Section2000c8 p c) :
    Structure.Coherent2000c8 c :=
  ⟨corr_8_s_exists h.notDisplaced, corr_8_s_savings h.notDisplaced⟩










theorem s2000c6_tierA
    {wc : Elements.WrittenComplaint} {s : Elements.PublicSchool} {c : ComplaintText}
    {p : Person}
    {act : Ontology.AttorneyGeneralCivilAction} {w : Ontology.WrittenComplaintT42IV}
    {par : Ontology.ParentT42IV} {cls : Ontology.SimilarlySituatedClass}
    {sb : Ontology.SchoolBoard} {pc : Ontology.PublicCollege}
    {sp : Person} {pw : Procedure.WrittenComplaint}
    (h : Elements.Section2000c6SchoolBoard wc s c) :
    Deontic.Power2000c6Exercised p c
    ∧ Ontology.AGCivilActionMembership act w par cls sb pc c
    ∧ Procedure.AGActionTrackProper sp pw c
    ∧ Structure.Coherent2000c6 c :=
  ⟨s2000c6_schoolBoard_elements_implies_deontic h,
   s2000c6_schoolBoard_elements_implies_ontology h,
   s2000c6_schoolBoard_elements_implies_procedure h,
   s2000c6_elements_implies_structure h⟩




theorem s2000c8_tierA
    {p : Person} {c : ComplaintText} {s : Ontology.PersonalSuitForRelief}
    (h : Elements.Section2000c8 p c) :
    Deontic.Permission2000c8Exercised p c
    ∧ Ontology.PersonalSuitMembership s p c
    ∧ Procedure.PrivateSuitTrackProper p c
    ∧ Structure.Coherent2000c8 c :=
  ⟨s2000c8_elements_implies_deontic h,
   s2000c8_elements_implies_ontology h,
   s2000c8_elements_implies_procedure h,
   s2000c8_elements_implies_structure h⟩

end Proving.USC.T42.SchoolDesegregation.Bridge
