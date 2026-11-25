










import Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.Types
import Proving.USC.T42.PublicAccommodations.Prohibition.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T42.PublicAccommodations.Prohibition.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String




def edge_2000a1_dependsOn_establishment : DefEdge :=
  { defined := "§ 2000a-1 freedom from state-required discrimination",
    dependsOn := "establishment or place", citeDefine := "42 USC § 2000a-1" }



def edge_2000a1_dependsOn_stateInstrument : DefEdge :=
  { defined := "§ 2000a-1 freedom from state-required discrimination",
    dependsOn := "state law/statute/ordinance/regulation/rule/order",
    citeDefine := "42 USC § 2000a-1" }


def edge_2000a1_dependsOn_treatment : DefEdge :=
  { defined := "§ 2000a-1 freedom from state-required discrimination",
    dependsOn := "discrimination or segregation", citeDefine := "42 USC § 2000a-1" }


def edge_treatment_dependsOn_ground : DefEdge :=
  { defined := "discrimination or segregation",
    dependsOn := "protected ground (race/color/religion/national origin)",
    citeDefine := "42 USC § 2000a-1" }


def edge_2000a2_dependsOn_securedRight : DefEdge :=
  { defined := "§ 2000a-2 anti-interference / anti-coercion",
    dependsOn := "right or privilege secured by §§ 2000a / 2000a-1",
    citeDefine := "42 USC § 2000a-2" }



def edge_securedRight_dependsOn_2000a1 : DefEdge :=
  { defined := "right or privilege secured by §§ 2000a / 2000a-1",
    dependsOn := "§ 2000a-1 freedom from state-required discrimination",
    citeDefine := "42 USC § 2000a-2" }


def edge_2000a2_dependsOn_interferingAct : DefEdge :=
  { defined := "§ 2000a-2 anti-interference / anti-coercion",
    dependsOn := "interfering act (deprive / intimidate / punish)",
    citeDefine := "42 USC § 2000a-2" }







structure GroundedTreatment (t : DiscriminatoryTreatment) (g : ProtectedGround)
    (c : ComplaintText) : Prop where
  treatment : IsDiscriminatoryTreatment t c
  onGround  : IsOnProtectedGround t g c





structure Section2000a1Membership (x : Establishment) (s : StateLawInstrument)
    (t : DiscriminatoryTreatment) (g : ProtectedGround) (c : ComplaintText) : Prop where
  establishment : IsEstablishment x c
  stateRequired : IsStateLawInstrument s c
  grounded      : GroundedTreatment t g c




structure Section2000a2Membership (r : SecuredRight) (a : InterferingAct)
    (p : Person) (c : ComplaintText) : Prop where
  securedRight : IsSecuredRight r c
  interfering  : IsInterferingAct a r c
  affected     : IsAffectedPerson p c

end Proving.USC.T42.PublicAccommodations.Prohibition.Ontology
