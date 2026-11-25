












import Proving.USC.T29.LMRA.Structure.Types

namespace Proving.USC.T29.LMRA.Structure









def edge_172b_incorporates_t5_pay : Ref :=
  { source := "29 USC § 172(b)", target := "5 USC ch. 51 & subch. III ch. 53", kind := .Incorporates }



def edge_172d_incorporates_29s51 : Ref :=
  { source := "29 USC § 172(d)", target := "29 USC § 51", kind := .Incorporates }



def edge_172d_overrides_secLabor : Ref :=
  { source := "29 USC § 172(d)", target := "Secretary of Labor authority (pre-1947)", kind := .Notwithstanding }



def edge_173e_incorporates_175a : Ref :=
  { source := "29 USC § 173(e)", target := "29 USC § 175a", kind := .Incorporates }




def edge_173f_incorporates_t5_adr : Ref :=
  { source := "29 USC § 173(f)", target := "5 USC subch. IV ch. 5 & 5 USC § 573", kind := .Incorporates }



def edge_175a_incorporates_157 : Ref :=
  { source := "29 USC § 175a(b)(3)", target := "29 USC § 157", kind := .Incorporates }



def edge_177c_incorporates_t15 : Ref :=
  { source := "29 USC § 177(c)", target := "15 USC §§ 49, 50", kind := .Incorporates }



def edge_178a_incorporates_176 : Ref :=
  { source := "29 USC § 178(a)", target := "29 USC § 176", kind := .Incorporates }




def edge_178b_overrides_ch6 : Ref :=
  { source := "29 USC § 178(b)", target := "29 USC ch. 6 (Norris-LaGuardia)", kind := .Notwithstanding }



def edge_178c_incorporates_t28 : Ref :=
  { source := "29 USC § 178(c)", target := "28 USC § 1254", kind := .Incorporates }



def edge_179a_incorporates_178 : Ref :=
  { source := "29 USC § 179(a)", target := "29 USC § 178", kind := .Incorporates }



def edge_182_except_rla : Ref :=
  { source := "29 USC § 182", target := "45 USC § 151 et seq. (Railway Labor Act)", kind := .ExceptAsProvided }



def edge_183a_incorporates_158d : Ref :=
  { source := "29 USC § 183(a)", target := "29 USC § 158(d)", kind := .Incorporates }




def edge_185_incorporates_chapDefs : Ref :=
  { source := "29 USC § 185(a)", target := "29 USC ch. 7 §§ 142, 152 (definitions)", kind := .Incorporates }



def edge_186b_incorporates_t49 : Ref :=
  { source := "29 USC § 186(b)(2)", target := "49 USC § 13102", kind := .Incorporates }




def edge_186c_except_lmrda : Ref :=
  { source := "29 USC § 186(c)(8)", target := "29 USC § 401 et seq. (LMRDA) & subch. II", kind := .ExceptAsProvided }




def edge_186c9_incorporates_175a : Ref :=
  { source := "29 USC § 186(c)(9)", target := "29 USC § 175a (LMCA 1978 § 5(b))", kind := .Incorporates }




def edge_186e_subjectTo_t28s381 : Ref :=
  { source := "29 USC § 186(e)", target := "28 USC § 381", kind := .SubjectTo }





def edge_186e_overrides_antiInjunction : Ref :=
  { source := "29 USC § 186(e)", target := "15 USC § 17, 29 USC § 52, 29 USC ch. 6", kind := .Notwithstanding }



def edge_187a_incorporates_158b4 : Ref :=
  { source := "29 USC § 187(a)", target := "29 USC § 158(b)(4)", kind := .Incorporates }




def edge_187b_subjectTo_185 : Ref :=
  { source := "29 USC § 187(b)", target := "29 USC § 185", kind := .SubjectTo }











axiom ReferencedSectionExists (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop





axiom IncorporationHonored (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop





axiom ExceptionApplies (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop





axiom OverrideTriggered (r : Ref) (c : Proving.USC.Common.ComplaintText) : Prop

end Proving.USC.T29.LMRA.Structure
