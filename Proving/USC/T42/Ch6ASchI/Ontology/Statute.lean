import Proving.USC.T42.Ch6ASchI.Ontology.Predicates











namespace Proving.USC.T42.Ch6ASchI.Ontology

open Proving.USC.Common






structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  external   : Bool := false


def defEdges : List DefEdge :=
  [ { defined := "described payment", dependsOn := "class settlement (Susan Walker v. Bayer)", citeDefine := "42 USC § 201(a)(2)(A)" }
  , { defined := "described payment", dependsOn := "release in lieu of the class settlement", citeDefine := "42 USC § 201(a)(2)(B)" }
  , { defined := "described payment", dependsOn := "Fund established under § 101 of the Act", citeDefine := "42 USC § 201(b)(2)" }
  , { defined := "the Service", dependsOn := "Office of the Surgeon General", citeDefine := "42 USC § 203" }
  , { defined := "the Service", dependsOn := "National Institutes of Health", citeDefine := "42 USC § 203" }
  , { defined := "the Service", dependsOn := "Bureau of Medical Services", citeDefine := "42 USC § 203" }
  , { defined := "the Service", dependsOn := "Bureau of State Services", citeDefine := "42 USC § 203" }
  , { defined := "the Service", dependsOn := "Agency for Healthcare Research and Quality", citeDefine := "42 USC § 203" }
  , { defined := "Regular Corps", dependsOn := "the Service", citeDefine := "42 USC § 204(a)(1)" }
  , { defined := "Ready Reserve Corps", dependsOn := "the Service", citeDefine := "42 USC § 204(a)(1)" }
  , { defined := "commissioned officer", dependsOn := "citizen of the United States", citeDefine := "42 USC § 204(a)(2)" }
  , { defined := "commissioned officer", dependsOn := "warrant officer (deemed)", citeDefine := "42 USC § 204(a)(5)" }
  , { defined := "Reserve Corps (any Federal statute)", dependsOn := "Ready Reserve Corps (deeming)", citeDefine := "42 USC § 204(c)(3)" }
  , { defined := "urgent or emergency public health care need", dependsOn := "national emergency", citeDefine := "42 USC § 204a(a)(5)(A)" }
  , { defined := "urgent or emergency public health care need", dependsOn := "major disaster", citeDefine := "42 USC § 204a(a)(5)(B)" }
  , { defined := "urgent or emergency public health care need", dependsOn := "public health emergency", citeDefine := "42 USC § 204a(a)(5)(C)", external := true }
  , { defined := "urgent or emergency public health care need", dependsOn := "any other appropriate emergency", citeDefine := "42 USC § 204a(a)(5)(D)" }
  , { defined := "Surgeon General", dependsOn := "Regular Corps membership", citeDefine := "42 USC § 205" }
  , { defined := "Surgeon General", dependsOn := "public-health training or experience", citeDefine := "42 USC § 205(2)" }
  , { defined := "Deputy Surgeon General", dependsOn := "Regular Corps", citeDefine := "42 USC § 206(a)" }
  , { defined := "Assistant Surgeon General", dependsOn := "Regular Corps / Ready Reserve Corps", citeDefine := "42 USC § 206(b),(c)" }
  , { defined := "commissioned grade", dependsOn := "corresponding Army grade", citeDefine := "42 USC § 207(a)" }
  , { defined := "medical-officer title", dependsOn := "commissioned grade", citeDefine := "42 USC § 207(b)" }
  , { defined := "original appointment", dependsOn := "commissioned grade", citeDefine := "42 USC § 209(a)" }
  , { defined := "original appointment", dependsOn := "examination in a § 209(a)(1) subject", citeDefine := "42 USC § 209(a)(1)" }
  , { defined := "osteopath appointment eligibility", dependsOn := "college of osteopathy licensure", citeDefine := "42 USC § 209d" }
  , { defined := "accumulated annual leave", dependsOn := "accrued annual leave", citeDefine := "42 USC § 210-1(c)" }
  , { defined := "professional category", dependsOn := "examination subject (§ 209(a)(1))", citeDefine := "42 USC § 210b(a)" }
  , { defined := "grade vacancy", dependsOn := "grade limits (§ 207(d))", citeDefine := "42 USC § 210b(d)", external := true }
  , { defined := "the Service", dependsOn := "the Secretary (administration)", citeDefine := "42 USC § 202", external := true }
  ]




def releaseSigningGraceDays : Nat := 270

def surgeonGeneralTermYears : Nat := 4

def assistantSurgeonsGeneralCount : Nat := 8

def specialTempPositionPercentCap : Nat := 1


def maxAppointmentAgeRegularCorps : Nat := 44

def aboveSeniorAssistantAppointmentPercentCap : Nat := 10

def maxAccumulatedAnnualLeaveDays : Nat := 120






inductive GradeKind where
  | director | senior | full | seniorAssistant | assistant | juniorAssistant
  | chiefWarrantW4 | chiefWarrantW3 | chiefWarrantW2 | warrantW1




inductive IsDescribedPayment (pmt : Payment) (c : ComplaintText) : Prop where
  | classSettlement : IsClassSettlementPayment pmt c → IsDescribedPayment pmt c
  | releaseInLieu   : IsReleaseInLieuPayment pmt c → IsDescribedPayment pmt c
  | fund            : IsFundPayment pmt c → IsDescribedPayment pmt c




inductive IsServiceComponent (u : ServiceUnit) (c : ComplaintText) : Prop where
  | officeOfSurgeonGeneral : IsOfficeOfSurgeonGeneralUnit u c → IsServiceComponent u c
  | nih                    : IsNIHUnit u c → IsServiceComponent u c
  | bureauMedicalServices  : IsBureauOfMedicalServicesUnit u c → IsServiceComponent u c
  | bureauStateServices    : IsBureauOfStateServicesUnit u c → IsServiceComponent u c
  | ahrq                   : IsAHRQUnit u c → IsServiceComponent u c




inductive IsUrgentOrEmergencyNeed (n : PublicHealthCareNeed) (c : ComplaintText) : Prop where
  | nationalEmergency : ArisesFromNationalEmergency n c → IsUrgentOrEmergencyNeed n c
  | majorDisaster     : ArisesFromMajorDisaster n c → IsUrgentOrEmergencyNeed n c
  | publicHealth      : ArisesFromPublicHealthEmergency n c → IsUrgentOrEmergencyNeed n c
  | other             : ArisesFromOtherDeployableEmergency n c → IsUrgentOrEmergencyNeed n c





structure CommissionedOfficerQualification (p : Person) (c : ComplaintText) : Prop where
  officer : IsCommissionedOfficer p c
  citizen : IsCitizenOfUS p c





structure SurgeonGeneralEligibility (p : Person) (c : ComplaintText) : Prop where
  regularCorps : IsMemberOfRegularCorps p c
  training     : HasPublicHealthTrainingOrExperience p c






inductive OsteopathAppointmentEligibility (p : Person) (c : ComplaintText) : Prop where
  | viaMajorityStates :
      IsGraduateOfOsteopathyCollege p c → EligibleForLicensureInMajorityOfStates p c →
      OsteopathAppointmentEligibility p c
  | viaApprovedBody :
      IsGraduateOfOsteopathyCollege p c → ApprovedByAcceptableBody p c →
      OsteopathAppointmentEligibility p c

end Proving.USC.T42.Ch6ASchI.Ontology
