








import Proving.USC.T22.Structure.Sub.Predicates

namespace Proving.USC.T22.Structure.Sub

open Proving.USC.Common




def edge_7103_incorporates_7107 : Ref :=
  { source := "22 USC § 7103", target := "22 USC § 7107", kind := .Incorporates }


def edge_7103_incorporates_7105 : Ref :=
  { source := "22 USC § 7103", target := "22 USC § 7105", kind := .Incorporates }


def edge_7103_incorporates_7104 : Ref :=
  { source := "22 USC § 7103", target := "22 USC § 7104", kind := .Incorporates }


def edge_7103_incorporates_ch78 : Ref :=
  { source := "22 USC § 7103", target := "22 USC ch78", kind := .Incorporates }


def edge_7103_incorporates_8usc1101 : Ref :=
  { source := "22 USC § 7103", target := "8 USC § 1101", kind := .Incorporates }



def edge_7103_incorporates_18usc_ch77 : Ref :=
  { source := "22 USC § 7103", target := "18 USC ch77", kind := .Incorporates }


def edge_7103_incorporates_34usc20702 : Ref :=
  { source := "22 USC § 7103", target := "34 USC § 20702", kind := .Incorporates }



def edge_7103_incorporates_19usc1307 : Ref :=
  { source := "22 USC § 7103", target := "19 USC § 1307", kind := .Incorporates }


def edge_7103_incorporates_22usc2152d : Ref :=
  { source := "22 USC § 7103", target := "22 USC § 2152d", kind := .Incorporates }



structure Coherent7103 (c : ComplaintText) : Prop where
  reportsExist     : ReferencedSectionExists edge_7103_incorporates_7107 c
  servicesHonored  : IncorporationHonored   edge_7103_incorporates_7105 c
  grantsHonored    : IncorporationHonored   edge_7103_incorporates_7104 c
  chapterCoheres   : IncorporationHonored   edge_7103_incorporates_ch78 c
  visaStatusExists : ReferencedSectionExists edge_7103_incorporates_8usc1101 c
  crimesExist      : ReferencedSectionExists edge_7103_incorporates_18usc_ch77 c




def edge_7106_incorporates_ch78 : Ref :=
  { source := "22 USC § 7106", target := "22 USC ch78", kind := .Incorporates }



def edge_7106_incorporates_7102 : Ref :=
  { source := "22 USC § 7106", target := "22 USC § 7102", kind := .Incorporates }



def edge_7106b_subjectTo_7106a : Ref :=
  { source := "22 USC § 7106(b)", target := "22 USC § 7106(a)", kind := .SubjectTo }



structure Coherent7106 (c : ComplaintText) : Prop where
  chapterIncorporated : IncorporationHonored   edge_7106_incorporates_ch78 c
  defnHonored         : IncorporationHonored   edge_7106_incorporates_7102 c
  internalCoheres     : ReferencedSectionExists edge_7106b_subjectTo_7106a c

end Proving.USC.T22.Structure.Sub
