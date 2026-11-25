






import Proving.USC.T18.Ch77.Part3.Ontology.Types
import Proving.USC.T18.Ch77.Part3.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch77.Part3.Ontology

open Proving.USC.Common





structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def edge_victim_dependsOn_chapterOffense : DefEdge :=
  { defined := "victim", dependsOn := "crime under this chapter",
    citeDefine := "18 USC § 1593(c)" }


def edge_victim_dependsOn_individualHarmed : DefEdge :=
  { defined := "victim", dependsOn := "individual harmed",
    citeDefine := "18 USC § 1593(c)" }


def edge_victim_dependsOn_legalGuardian : DefEdge :=
  { defined := "victim", dependsOn := "legal guardian",
    citeDefine := "18 USC § 1593(c)" }


def edge_victim_dependsOn_estateRepresentative : DefEdge :=
  { defined := "victim", dependsOn := "representative of the victim's estate",
    citeDefine := "18 USC § 1593(c)" }


def edge_victim_dependsOn_familyMember : DefEdge :=
  { defined := "victim", dependsOn := "family member",
    citeDefine := "18 USC § 1593(c)" }



def edge_victim_dependsOn_courtAppointee : DefEdge :=
  { defined := "victim", dependsOn := "person appointed as suitable by the court",
    citeDefine := "18 USC § 1593(c)" }



def edge_victim_dependsOn_defendant : DefEdge :=
  { defined := "victim", dependsOn := "defendant",
    citeDefine := "18 USC § 1593(c)" }


def edge_fullAmount_dependsOn_victim : DefEdge :=
  { defined := "full amount of the victim's losses", dependsOn := "victim",
    citeDefine := "18 USC § 1593(b)(3)" }


def edge_fullAmount_dependsOn_s2259c2 : DefEdge :=
  { defined := "full amount of the victim's losses",
    dependsOn := "full amount of the victim's losses (18 USC § 2259(c)(2))",
    citeDefine := "18 USC § 1593(b)(3)" }


def edge_fullAmount_dependsOn_grossIncomeOrValue : DefEdge :=
  { defined := "full amount of the victim's losses",
    dependsOn := "gross income or value to the defendant of the victim's services or labor",
    citeDefine := "18 USC § 1593(b)(3)" }


def edge_fullAmount_dependsOn_flsaValue : DefEdge :=
  { defined := "full amount of the victim's losses",
    dependsOn := "value of the victim's labor guaranteed under the Fair Labor Standards Act",
    citeDefine := "18 USC § 1593(b)(3)" }


def edge_order_dependsOn_victim : DefEdge :=
  { defined := "order of restitution under this section", dependsOn := "victim",
    citeDefine := "18 USC § 1593(b)(1)" }


def edge_order_dependsOn_fullAmount : DefEdge :=
  { defined := "order of restitution under this section",
    dependsOn := "full amount of the victim's losses",
    citeDefine := "18 USC § 1593(b)(1)" }



def edge_order_dependsOn_s3664 : DefEdge :=
  { defined := "order of restitution under this section",
    dependsOn := "order under section 3664 / section 3663A",
    citeDefine := "18 USC § 1593(b)(2)" }



def edge_forfeiture_dependsOn_s853 : DefEdge :=
  { defined := "forfeiture of property under this subsection",
    dependsOn := "section 413 of the Controlled Substances Act (21 USC § 853)",
    citeDefine := "18 USC § 1593(b)(4)" }



def edge_section1593a_dependsOn_chapterOffense : DefEdge :=
  { defined := "18 USC § 1593(a) (using section)",
    dependsOn := "offense under this chapter",
    citeDefine := "18 USC § 1593(a)" }


def defEdges : List DefEdge :=
  [ edge_victim_dependsOn_chapterOffense,
    edge_victim_dependsOn_individualHarmed,
    edge_victim_dependsOn_legalGuardian,
    edge_victim_dependsOn_estateRepresentative,
    edge_victim_dependsOn_familyMember,
    edge_victim_dependsOn_courtAppointee,
    edge_victim_dependsOn_defendant,
    edge_fullAmount_dependsOn_victim,
    edge_fullAmount_dependsOn_s2259c2,
    edge_fullAmount_dependsOn_grossIncomeOrValue,
    edge_fullAmount_dependsOn_flsaValue,
    edge_order_dependsOn_victim,
    edge_order_dependsOn_fullAmount,
    edge_order_dependsOn_s3664,
    edge_forfeiture_dependsOn_s853,
    edge_section1593a_dependsOn_chapterOffense ]





structure DirectVictim (p : Person) (o : Offense) (c : ComplaintText) : Prop where
  chapterOffense : IsOffenseUnderThisChapter o c
  harmed         : HarmResultedFromOffense p o c




inductive RepresentationTrigger (p : Person) (c : ComplaintText) : Prop where
  | minor         : IsUnderEighteen p c   → RepresentationTrigger p c
  | incompetent   : IsIncompetent p c     → RepresentationTrigger p c
  | incapacitated : IsIncapacitated p c   → RepresentationTrigger p c
  | deceased      : IsDeceased p c        → RepresentationTrigger p c





inductive RepresentativeCategory (r p : Person) (c : ComplaintText) : Prop where
  | legalGuardian        : IsLegalGuardianOf r p c            → RepresentativeCategory r p c
  | estateRepresentative : IsRepresentativeOfEstateOf r p c    → RepresentativeCategory r p c
  | familyMember         : IsFamilyMemberOf r p c              → RepresentativeCategory r p c
  | courtAppointed       : IsCourtAppointedSuitablePerson r p c → RepresentativeCategory r p c





structure RepresentativeVictim (r p : Person) (o : Offense) (c : ComplaintText) : Prop where
  principal    : DirectVictim p o c
  trigger      : RepresentationTrigger p c
  category     : RepresentativeCategory r p c
  notDefendant : ¬ IsDefendant r c



inductive Section1593cVictim (c : ComplaintText) : Person → Prop where
  | direct {p : Person} {o : Offense} :
      DirectVictim p o c → Section1593cVictim c p
  | representative {r p : Person} {o : Offense} :
      RepresentativeVictim r p o c → Section1593cVictim c r






noncomputable def fullAmountOfVictimsLosses (p : Person) (c : ComplaintText) : Nat :=
  section2259c2LossAmount p c
    + max (grossIncomeOrValueToDefendant p c) (flsaGuaranteedLaborValue p c)




structure FullAmountOfVictimsLosses (p : Person) (n : Nat) (c : ComplaintText) : Prop where
  victim : Section1593cVictim c p
  amount : n = fullAmountOfVictimsLosses p c





structure Section1593bOrder
    (ord : RestitutionOrder) (p : Person) (n : Nat) (c : ComplaintText) : Prop where
  order       : IsOrderOfRestitutionUnderSection1593 ord c
  directsPay  : DirectsPaymentToVictim ord p c
  fullAmount  : FullAmountOfVictimsLosses p n c
  enforcement : IssuedAndEnforcedUnderSection3664 ord c









structure Section1593b4Forfeiture (pr : Property) (c : ComplaintText) : Prop where
  subject  : IsPropertySubjectToForfeiture pr c
  governed : GovernedBySection853 pr c

end Proving.USC.T18.Ch77.Part3.Ontology
