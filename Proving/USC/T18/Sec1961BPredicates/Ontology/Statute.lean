













import Proving.USC.T18.Sec1961BPredicates.Ontology.Types
import Proving.USC.T18.Sec1961BPredicates.Ontology.Predicates
import Proving.USC.Common.Types

namespace Proving.USC.T18.Sec1961BPredicates.Ontology

open Proving.USC.Common



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String


def uscOntologyEdges : List DefEdge :=
  [
    { defined := "false identification document", dependsOn := "identification document", citeDefine := "18 USC § 1028(d)(4)" },
    { defined := "false identification document", dependsOn := "issuing authority",        citeDefine := "18 USC § 1028(d)(4)" },
    { defined := "false identification document", dependsOn := "State",                    citeDefine := "18 USC § 1028(d)(4)" },
    { defined := "authentication feature",        dependsOn := "identification document",  citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "authentication feature",        dependsOn := "document-making implement", citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "authentication feature",        dependsOn := "means of identification",  citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "authentication feature",        dependsOn := "issuing authority",        citeDefine := "18 USC § 1028(d)(1)" },
    { defined := "false authentication feature",  dependsOn := "authentication feature",   citeDefine := "18 USC § 1028(d)(5)" },
    { defined := "false authentication feature",  dependsOn := "issuing authority",        citeDefine := "18 USC § 1028(d)(5)" },
    { defined := "document-making implement",     dependsOn := "identification document",  citeDefine := "18 USC § 1028(d)(2)" },
    { defined := "document-making implement",     dependsOn := "false identification document", citeDefine := "18 USC § 1028(d)(2)" },
    { defined := "issuing authority",             dependsOn := "identification document",  citeDefine := "18 USC § 1028(d)(6)" },
    { defined := "issuing authority",             dependsOn := "means of identification",  citeDefine := "18 USC § 1028(d)(6)" },
    { defined := "issuing authority",             dependsOn := "authentication feature",   citeDefine := "18 USC § 1028(d)(6)" },
    { defined := "issuing authority",             dependsOn := "State",                    citeDefine := "18 USC § 1028(d)(6)" },
    { defined := "means of identification",       dependsOn := "access device",            citeDefine := "18 USC § 1028(d)(7)(D)" },
    { defined := "personal identification card",  dependsOn := "identification document",  citeDefine := "18 USC § 1028(d)(8)" },
    { defined := "personal identification card",  dependsOn := "State",                    citeDefine := "18 USC § 1028(d)(8)" },

    { defined := "counterfeit access device",     dependsOn := "access device",            citeDefine := "18 USC § 1029(e)(2)" },
    { defined := "unauthorized access device",    dependsOn := "access device",            citeDefine := "18 USC § 1029(e)(3)" },
    { defined := "device-making equipment",       dependsOn := "access device",            citeDefine := "18 USC § 1029(e)(6)" },
    { defined := "device-making equipment",       dependsOn := "counterfeit access device", citeDefine := "18 USC § 1029(e)(6)" },
    { defined := "scanning receiver",             dependsOn := "telecommunications service", citeDefine := "18 USC § 1029(e)(8)" },

    { defined := "illegal gambling business",     dependsOn := "gambling business",        citeDefine := "18 USC § 1955(b)(1)" },
    { defined := "illegal gambling business",     dependsOn := "State",                    citeDefine := "18 USC § 1955(b)(1)(i)" },
    { defined := "illegal gambling business",     dependsOn := "gambling",                 citeDefine := "18 USC § 1955(b)(4)" },

    { defined := "veterans' memorial object",     dependsOn := "veteran",                  citeDefine := "18 USC § 2314" } ]





structure IllegalGamblingBusinessDef (g : GamblingBusiness) (c : ComplaintText) : Prop where
  stateViolation : ViolatesStateGamblingLaw g c
  fivePersons    : InvolvesFiveOrMorePersons g c
  continuity     : MeetsContinuityOrRevenueThreshold g c
  membership     : IsIllegalGamblingBusiness g c




structure MeansOfIdViaAccessDevice
    (m : MeansOfIdentification) (a : AccessDevice) (c : ComplaintText) : Prop where
  viaAccessDevice : IsAccessDevice a c
  means           : IsMeansOfIdentification m c



structure FalseAuthFeatureDef
    (f : FalseAuthenticationFeature) (e : Entity) (c : ComplaintText) : Prop where
  authority : IsIssuingAuthority e c
  feature   : IsFalseAuthenticationFeature f c



structure PersonalIdCardDef
    (p : PersonalIdentificationCard) (d : IdentificationDocument) (c : ComplaintText) : Prop where
  baseDocument : IsIdentificationDocument d c
  card         : IsPersonalIdentificationCard p c





inductive AccessDeviceStatus (a : AccessDevice) (c : ComplaintText) : Prop where
  | counterfeit  (h : IsCounterfeitAccessDevice a c)  : AccessDeviceStatus a c
  | unauthorized (h : IsUnauthorizedAccessDevice a c) : AccessDeviceStatus a c

end Proving.USC.T18.Sec1961BPredicates.Ontology
