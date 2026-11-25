








import Proving.USC.T18.Ch96.Structure.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch96.Structure

open Proving.USC.Common










def edge_1961_incorporates_csa102 : Ref :=
  { source := "18 USC § 1961", target := "21 USC § 802 (Controlled Substances Act § 102)", kind := .Incorporates }






def edge_1961_incorporates_t18Predicates : Ref :=
  { source := "18 USC § 1961", target := "18 USC §§ 201–2332b (enumerated predicate offenses)", kind := .Incorporates }




def edge_1961_incorporates_t29 : Ref :=
  { source := "18 USC § 1961", target := "29 USC §§ 186, 501(c)", kind := .Incorporates }



def edge_1961_incorporates_t11 : Ref :=
  { source := "18 USC § 1961", target := "11 USC (title 11 — bankruptcy)", kind := .Incorporates }



def edge_1961_except_t18_157 : Ref :=
  { source := "18 USC § 1961", target := "18 USC § 157", kind := .ExceptAsProvided }



def edge_1961_incorporates_ina : Ref :=
  { source := "18 USC § 1961", target := "INA §§ 274, 277, 278 (8 USC §§ 1324, 1327, 1328)", kind := .Incorporates }



def edge_1961_incorporates_currencyAct : Ref :=
  { source := "18 USC § 1961", target := "31 USC ch. 53 (Currency and Foreign Transactions Reporting Act)", kind := .Incorporates }



def edge_1961_incorporates_2332b : Ref :=
  { source := "18 USC § 1961", target := "18 USC § 2332b(g)(5)(B)", kind := .Incorporates }







def edge_1962_incorporates_1961 : Ref :=
  { source := "18 USC § 1962", target := "18 USC § 1961", kind := .Incorporates }



def edge_1962a_incorporates_s2 : Ref :=
  { source := "18 USC § 1962(a)", target := "18 USC § 2", kind := .Incorporates }



def edge_1962d_incorporates_1962abc : Ref :=
  { source := "18 USC § 1962(d)", target := "18 USC § 1962(a)–(c)", kind := .Incorporates }








def edge_1963_incorporates_1962 : Ref :=
  { source := "18 USC § 1963", target := "18 USC § 1962", kind := .Incorporates }




def edge_1963f_notwithstanding_3302b : Ref :=
  { source := "18 USC § 1963(f)", target := "31 USC § 3302(b)", kind := .Notwithstanding }




def edge_1963i_except_1963l : Ref :=
  { source := "18 USC § 1963(i)", target := "18 USC § 1963(l)", kind := .ExceptAsProvided }





def edge_1964_incorporates_1962 : Ref :=
  { source := "18 USC § 1964", target := "18 USC § 1962", kind := .Incorporates }




def edge_1965b_incorporates_1964 : Ref :=
  { source := "18 USC § 1965(b)", target := "18 USC § 1964", kind := .Incorporates }








def edge_1968_incorporates_1961 : Ref :=
  { source := "18 USC § 1968", target := "18 USC § 1961", kind := .Incorporates }







structure Coherent1961 (c : ComplaintText) : Prop where
  csaExists         : ReferencedSectionExists edge_1961_incorporates_csa102 c
  predicatesExist   : ReferencedSectionExists edge_1961_incorporates_t18Predicates c
  t29Exists         : ReferencedSectionExists edge_1961_incorporates_t29 c
  t11Exists         : ReferencedSectionExists edge_1961_incorporates_t11 c
  s157Carve         : ExceptionApplies edge_1961_except_t18_157 c
  inaExists         : ReferencedSectionExists edge_1961_incorporates_ina c
  currencyActExists : ReferencedSectionExists edge_1961_incorporates_currencyAct c
  s2332bExists      : ReferencedSectionExists edge_1961_incorporates_2332b c



structure Coherent1962 (c : ComplaintText) : Prop where
  incorporatesDefs       : IncorporationHonored edge_1962_incorporates_1961 c
  principalDefExists     : ReferencedSectionExists edge_1962a_incorporates_s2 c
  conspiracyTargetsExist : ReferencedSectionExists edge_1962d_incorporates_1962abc c



structure Coherent1963 (c : ComplaintText) : Prop where
  predicateOffenseExists    : ReferencedSectionExists edge_1963_incorporates_1962 c
  customsOverrideFires      : OverrideTriggered edge_1963f_notwithstanding_3302b c
  ancillaryExceptionHonored : ExceptionApplies edge_1963i_except_1963l c


structure Coherent1964 (c : ComplaintText) : Prop where
  predicateOffenseExists : ReferencedSectionExists edge_1964_incorporates_1962 c


structure Coherent1965 (c : ComplaintText) : Prop where
  civilRemedyRegimeExists : ReferencedSectionExists edge_1965b_incorporates_1964 c


structure Coherent1968 (c : ComplaintText) : Prop where
  definitionsExist : IncorporationHonored edge_1968_incorporates_1961 c

end Proving.USC.T18.Ch96.Structure
