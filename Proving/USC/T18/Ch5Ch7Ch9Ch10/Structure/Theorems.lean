import Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure.Statute
import Proving.USC.Common.Types




namespace Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure

open Proving.USC.Common

theorem coherent111_intro {c}
    (h1114 : IncorporationHonored e111_inc1114 c) : Coherent111 c :=
  ⟨h1114⟩

theorem coherent112_intro {c}
    (hDefs : IncorporationHonored e112_inc1116b c)
    (hJuris : IncorporationHonored e112_incJuris c)
    (h1stAmd : SavingsPreserved e112_sav1stAmend c)
    (hContrary : OverrideTriggered e112_nwContrary c) : Coherent112 c :=
  ⟨hDefs, hJuris, h1stAmd, hContrary⟩

theorem coherent113_intro {c}
    (hSex : ReferencedSectionExists e113_inc2241_2242 c)
    (hSbi : IncorporationHonored e113_inc1365 c)
    (hPartner : IncorporationHonored e113_inc2266 c) : Coherent113 c :=
  ⟨hSex, hSbi, hPartner⟩

theorem coherent114_intro {c}
    (hTorture : IncorporationHonored e114_inc2340 c) : Coherent114 c :=
  ⟨hTorture⟩

theorem coherent115_intro {c}
    (hClass : IncorporationHonored e115_inc1114 c)
    (hPath : Section115PenaltyPath c)
    (hSS : SavingsPreserved e115_savSecretService c) : Coherent115 c :=
  ⟨hClass, hPath, hSS⟩

theorem coherent116_intro {c}
    (hMed : ExceptionApplies e116_exceptSubB c) : Coherent116 c :=
  ⟨hMed⟩

theorem coherent117_intro {c}
    (hPrior : IncorporationHonored e117_incCh110A c) : Coherent117 c :=
  ⟨hPrior⟩

theorem coherent118_intro {c}
    (h2709 : IncorporationHonored e118_inc22s2709 c)
    (h4802 : IncorporationHonored e118_inc22s4802 c) : Coherent118 c :=
  ⟨h2709, h4802⟩

theorem coherent119_intro {c}
    (hClass : IncorporationHonored e119_inc1114 c)
    (hCov : IncorporationHonored e119_inc16 c)
    (hFamily : IncorporationHonored e119_inc115c2 c) : Coherent119 c :=
  ⟨hClass, hCov, hFamily⟩

theorem coherent151_intro {c}
    (hT11 : IncorporationHonored e151_incT11 c) : Coherent151 c :=
  ⟨hT11⟩

theorem coherent152_intro {c}
    (hT11 : IncorporationHonored e152_incT11 c)
    (hPerjury : IncorporationHonored e152_inc28s1746 c) : Coherent152 c :=
  ⟨hT11, hPerjury⟩

theorem coherent153_intro {c}
    (hT11 : IncorporationHonored e153_incT11 c)
    (hDebtor : IncorporationHonored e153_inc151 c) : Coherent153 c :=
  ⟨hT11, hDebtor⟩

theorem coherent154_intro {c}
    (hT11 : IncorporationHonored e154_incT11 c) : Coherent154 c :=
  ⟨hT11⟩

theorem coherent155_intro {c}
    (hT11 : IncorporationHonored e155_incT11 c) : Coherent155 c :=
  ⟨hT11⟩

theorem coherent156_intro {c}
    (hT11 : IncorporationHonored e156_incT11 c)
    (hFrbp : IncorporationHonored e156_incFRBP c) : Coherent156 c :=
  ⟨hT11, hFrbp⟩

theorem coherent157_intro {c}
    (hT11 : IncorporationHonored e157_incT11 c)
    (hInv : IncorporationHonored e157_inc11s303 c) : Coherent157 c :=
  ⟨hT11, hInv⟩

theorem coherent158_intro {c}
    (h152 : ReferencedSectionExists e158_inc152 c)
    (h157 : ReferencedSectionExists e158_inc157 c)
    (h3057 : ReferencedSectionExists e158_inc3057 c) : Coherent158 c :=
  ⟨h152, h157, h3057⟩

theorem coherent175_intro {c}
    (hDefs : IncorporationHonored e175_inc178 c) : Coherent175 c :=
  ⟨hDefs⟩

theorem coherent175a_intro {c}
    (hMil : IncorporationHonored e175a_inc10s382 c)
    (h175 : ReferencedSectionExists e175a_inc175 c) : Coherent175a c :=
  ⟨hMil, h175⟩

theorem coherent175b_intro {c}
    (hReg : IncorporationHonored e175b_inc42s262a c)
    (hIna : IncorporationHonored e175b_inc8s1101 c)
    (hGov : ExceptionApplies e175b_exceptGovAct c) : Coherent175b c :=
  ⟨hReg, hIna, hGov⟩

theorem coherent175c_intro {c}
    (hHhs : ExceptionApplies e175c_exceptHHS c) : Coherent175c c :=
  ⟨hHhs⟩

theorem coherent176_intro {c}
    (h175 : ReferencedSectionExists e176_inc175 c)
    (hCustoms : IncorporationHonored e176_incCustoms c)
    (hExigent : ExceptionApplies e176_exceptExigent c) : Coherent176 c :=
  ⟨h175, hCustoms, hExigent⟩

theorem coherent177_intro {c}
    (h175 : ReferencedSectionExists e177_inc175 c) : Coherent177 c :=
  ⟨h175⟩

theorem coherent178_intro {c}
    (hNational : IncorporationHonored e178_inc8s1101a22 c) : Coherent178 c :=
  ⟨hNational⟩

end Proving.USC.T18.Ch5Ch7Ch9Ch10.Structure
