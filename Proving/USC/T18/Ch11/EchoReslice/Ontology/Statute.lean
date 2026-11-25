










import Proving.USC.T18.Ch11.EchoReslice.Ontology.Types
import Proving.USC.T18.Ch11.EchoReslice.Ontology.Predicates
import Proving.USC.Common.Types

set_option autoImplicit false

open Proving.USC.Common (Person Entity ComplaintText Time)

namespace Proving.USC.T18.Ch11.EchoReslice.Ontology







structure TermDefinition where
  term       : String
  citeDefine : String
  scope      : String
  deriving Repr



structure DefEdge where
  defined    : String
  dependsOn  : String
  citeDefine : String
  deriving Repr



structure DanglingTerm where
  term     : String
  usedAt   : String
  deriving Repr


structure SectionRelation where
  thisSection    : String
  relatedSection : String
  relation       : String
  deriving Repr


def def_publicOfficial : TermDefinition :=
  { term := "public official", citeDefine := "18 USC § 201(a)(1)",
    scope := "this section" }


def def_personSelectedToBePublicOfficial : TermDefinition :=
  { term := "person who has been selected to be a public official",
    citeDefine := "18 USC § 201(a)(2)", scope := "this section" }


def def_officialAct : TermDefinition :=
  { term := "official act", citeDefine := "18 USC § 201(a)(3)",
    scope := "this section" }



def edge_publicOfficial_dependsOn_governmentUnit : DefEdge :=
  { defined := "public official", dependsOn := "department, agency or branch of Government",
    citeDefine := "18 USC § 201(a)(1)" }


def edge_publicOfficial_dependsOn_officialFunction : DefEdge :=
  { defined := "public official", dependsOn := "official function",
    citeDefine := "18 USC § 201(a)(1)" }



def edge_selected_dependsOn_publicOfficial : DefEdge :=
  { defined := "person who has been selected to be a public official",
    dependsOn := "public official", citeDefine := "18 USC § 201(a)(2)" }


def edge_officialAct_dependsOn_publicOfficial : DefEdge :=
  { defined := "official act", dependsOn := "public official",
    citeDefine := "18 USC § 201(a)(3)" }



def edge_officialAct_dependsOn_matter : DefEdge :=
  { defined := "official act",
    dependsOn := "question, matter, cause, suit, proceeding or controversy",
    citeDefine := "18 USC § 201(a)(3)" }



def edge_s201b1_usesOfficialAct : DefEdge :=
  { defined := "18 USC § 201(b)(1)", dependsOn := "official act",
    citeDefine := "18 USC § 201(a)(3)" }


def edge_s201b2_usesOfficialAct : DefEdge :=
  { defined := "18 USC § 201(b)(2)", dependsOn := "official act",
    citeDefine := "18 USC § 201(a)(3)" }


def edge_s201c1_usesOfficialAct : DefEdge :=
  { defined := "18 USC § 201(c)(1)", dependsOn := "official act",
    citeDefine := "18 USC § 201(a)(3)" }


def edge_s201c1_usesPublicOfficial : DefEdge :=
  { defined := "18 USC § 201(c)(1)", dependsOn := "public official",
    citeDefine := "18 USC § 201(a)(1)" }



def edge_s201c1_usesFormerPublicOfficial : DefEdge :=
  { defined := "18 USC § 201(c)(1)", dependsOn := "former public official",
    citeDefine := "(undefined in 18 USC § 201)" }


def dangling_anythingOfValue : DanglingTerm :=
  { term := "anything of value",
    usedAt := "18 USC § 201(b)(1),(2),(3),(4); § 201(c)(1),(2),(3)" }



def dangling_corruptly : DanglingTerm :=
  { term := "corruptly", usedAt := "18 USC § 201(b)(1),(2),(3),(4)" }


def dangling_formerPublicOfficial : DanglingTerm :=
  { term := "former public official", usedAt := "18 USC § 201(c)(1)(A),(B)" }


def dangling_witness : DanglingTerm :=
  { term := "witness",
    usedAt := "18 USC § 201(b)(3),(4); § 201(c)(2),(3); § 201(d)" }


def dangling_lawfulDuty : DanglingTerm :=
  { term := "lawful duty", usedAt := "18 USC § 201(b)(1)(C)" }


def dangling_officialDuty : DanglingTerm :=
  { term := "official duty",
    usedAt := "18 USC § 201(b)(2)(C); § 201(c)(1)(A),(B)" }


def dangling_fraudOnTheUnitedStates : DanglingTerm :=
  { term := "fraud on the United States",
    usedAt := "18 USC § 201(b)(1)(B); § 201(b)(2)(B)" }



def dangling_officeOfHonorTrustOrProfit : DanglingTerm :=
  { term := "office of honor, trust, or profit under the United States",
    usedAt := "18 USC § 201(b) (penalty clause)" }



def dangling_monetaryEquivalent : DanglingTerm :=
  { term := "monetary equivalent of the thing of value",
    usedAt := "18 USC § 201(b) (penalty clause)" }



def rel_s201_separateFrom_s1503 : SectionRelation :=
  { thisSection := "18 USC § 201", relatedSection := "18 USC § 1503",
    relation := "separate from and in addition to" }


def rel_s201_separateFrom_s1504 : SectionRelation :=
  { thisSection := "18 USC § 201", relatedSection := "18 USC § 1504",
    relation := "separate from and in addition to" }


def rel_s201_separateFrom_s1505 : SectionRelation :=
  { thisSection := "18 USC § 201", relatedSection := "18 USC § 1505",
    relation := "separate from and in addition to" }


def defEdges : List DefEdge :=
  [ edge_publicOfficial_dependsOn_governmentUnit,
    edge_publicOfficial_dependsOn_officialFunction,
    edge_selected_dependsOn_publicOfficial,
    edge_officialAct_dependsOn_publicOfficial,
    edge_officialAct_dependsOn_matter,
    edge_s201b1_usesOfficialAct,
    edge_s201b2_usesOfficialAct,
    edge_s201c1_usesOfficialAct,
    edge_s201c1_usesPublicOfficial,
    edge_s201c1_usesFormerPublicOfficial ]


def danglingTerms : List DanglingTerm :=
  [ dangling_anythingOfValue, dangling_corruptly, dangling_formerPublicOfficial,
    dangling_witness, dangling_lawfulDuty, dangling_officialDuty,
    dangling_fraudOnTheUnitedStates, dangling_officeOfHonorTrustOrProfit,
    dangling_monetaryEquivalent ]





inductive CongressionalOfficialClass (p : Person) (c : ComplaintText) : Prop
  | memberOfCongress    : IsMemberOfCongress p c → CongressionalOfficialClass p c
  | delegate            : IsDelegateToCongress p c → CongressionalOfficialClass p c
  | residentCommissioner : IsResidentCommissioner p c → CongressionalOfficialClass p c



inductive GovernmentUnitClass (g : GovernmentUnit) (c : ComplaintText) : Prop
  | unitedStates       : IsTheUnitedStates g c → GovernmentUnitClass g c
  | department         : IsDepartmentOfGovernment g c → GovernmentUnitClass g c
  | agency             : IsAgencyOfGovernment g c → GovernmentUnitClass g c
  | branch             : IsBranchOfGovernment g c → GovernmentUnitClass g c
  | districtOfColumbia : IsDistrictOfColumbiaUnit g c → GovernmentUnitClass g c



inductive FederalRoleClass (p : Person) (c : ComplaintText) : Prop
  | officer             : IsOfficerOfTheUnitedStates p c → FederalRoleClass p c
  | employee            : IsEmployeeOfTheUnitedStates p c → FederalRoleClass p c
  | actingForOrOnBehalf : ActsForOrOnBehalfOfTheUnitedStates p c → FederalRoleClass p c




structure FederalFunctionaryOfficial (p : Person) (g : GovernmentUnit)
    (f : OfficialFunction) (c : ComplaintText) : Prop where
  role          : FederalRoleClass p c
  unit          : GovernmentUnitClass g c
  functionKind  : IsOfficialFunction f c
  inFunction    : ActsInOfficialFunction p f c
  underAuthority : ActsUnderOrByAuthorityOfGovernmentUnit p g c





inductive PublicOfficialClass (p : Person) (c : ComplaintText) : Prop
  | congressional : CongressionalOfficialClass p c → PublicOfficialClass p c
  | functionary   : ∀ (g : GovernmentUnit) (f : OfficialFunction),
                      FederalFunctionaryOfficial p g f c → PublicOfficialClass p c
  | juror         : IsJuror p c → PublicOfficialClass p c





inductive SelectionRouteClass (s : SelectionEvent) (c : ComplaintText) : Prop
  | nominated         : IsNominationEvent s c → SelectionRouteClass s c
  | appointed         : IsAppointmentEvent s c → SelectionRouteClass s c
  | officiallyInformed : IsOfficialInformingOfProspectiveSelection s c →
                          SelectionRouteClass s c



structure SelectedToBePublicOfficial (p : Person) (o : Office)
    (s : SelectionEvent) (c : ComplaintText) : Prop where
  post        : IsPublicOfficialPost o c
  namesPerson : SelectionEventNamesPerson s p c
  targetsPost : SelectionEventTargetsPost s o c
  route       : SelectionRouteClass s c




inductive DecisionOrActionClass (a : DecisionOrAction) (c : ComplaintText) : Prop
  | decision : IsDecision a c → DecisionOrActionClass a c
  | action   : IsAction a c → DecisionOrActionClass a c



inductive QualifyingMatterClass (m : Matter) (c : ComplaintText) : Prop
  | question    : IsQuestionMatter m c → QualifyingMatterClass m c
  | matter      : IsMatterProper m c → QualifyingMatterClass m c
  | cause       : IsCauseMatter m c → QualifyingMatterClass m c
  | suit        : IsSuitMatter m c → QualifyingMatterClass m c
  | proceeding  : IsProceedingMatter m c → QualifyingMatterClass m c
  | controversy : IsControversyMatter m c → QualifyingMatterClass m c



inductive PendencyBeforeOfficialClass (m : Matter) (p : Person)
    (c : ComplaintText) : Prop
  | mayBePending      : MayAtAnyTimeBePendingBeforeOfficial m p c →
                          PendencyBeforeOfficialClass m p c
  | mayByLawBeBrought : MayByLawBeBroughtBeforeOfficial m p c →
                          PendencyBeforeOfficialClass m p c



inductive OfficialCapacityClass (p : Person) (c : ComplaintText) : Prop
  | officialCapacity    : ActsInOfficialCapacity p c → OfficialCapacityClass p c
  | placeOfTrustOrProfit : ActsInPlaceOfTrustOrProfit p c → OfficialCapacityClass p c




structure OfficialAct (a : DecisionOrAction) (m : Matter) (p : Person)
    (c : ComplaintText) : Prop where
  actKind  : DecisionOrActionClass a c
  onMatter : DecisionOrActionOnMatter a m c
  matter   : QualifyingMatterClass m c
  pendency : PendencyBeforeOfficialClass m p c
  official : PublicOfficialClass p c
  capacity : OfficialCapacityClass p c




inductive TribunalBodyClass (t : Tribunal) (c : ComplaintText) : Prop
  | agency     : IsAgencyBody t c → TribunalBodyClass t c
  | commission : IsCommissionBody t c → TribunalBodyClass t c
  | officer    : IsOfficerBody t c → TribunalBodyClass t c



inductive TribunalAuthorizationClass (t : Tribunal) (c : ComplaintText) : Prop
  | hearEvidence  : AuthorizedByLawsOfUnitedStatesToHearEvidence t c →
                      TribunalAuthorizationClass t c
  | takeTestimony : AuthorizedByLawsOfUnitedStatesToTakeTestimony t c →
                      TribunalAuthorizationClass t c





inductive AuthorizedTribunalClass (t : Tribunal) (c : ComplaintText) : Prop
  | court               : IsCourt t c → AuthorizedTribunalClass t c
  | congressionalCommittee : IsCommitteeOfEitherHouseOrBothHouses t c →
                               AuthorizedTribunalClass t c
  | authorizedBody      : TribunalBodyClass t c → TribunalAuthorizationClass t c →
                            AuthorizedTribunalClass t c


inductive ProceedingKindClass (pr : Proceeding) (c : ComplaintText) : Prop
  | trial           : IsTrial pr c → ProceedingKindClass pr c
  | hearing         : IsHearing pr c → ProceedingKindClass pr c
  | otherProceeding : IsOtherProceeding pr c → ProceedingKindClass pr c



structure QualifyingProceeding (pr : Proceeding) (t : Tribunal)
    (c : ComplaintText) : Prop where
  kind     : ProceedingKindClass pr c
  before   : ProceedingHeldBeforeTribunal pr t c
  tribunal : AuthorizedTribunalClass t c


inductive TestimonyModeClass (tst : Testimony) (c : ComplaintText) : Prop
  | oath        : GivenUnderOath tst c → TestimonyModeClass tst c
  | affirmation : GivenUnderAffirmation tst c → TestimonyModeClass tst c



structure TestimonyOfWitnessUnderOathOrAffirmation (tst : Testimony)
    (p : Person) (pr : Proceeding) (t : Tribunal) (c : ComplaintText) : Prop where
  testimony  : IsTestimonyOfWitness tst p c
  mode       : TestimonyModeClass tst c
  witness    : IsWitnessUponProceeding p pr c
  proceeding : QualifyingProceeding pr t c






inductive OfficialOrFormerOrSelectedClass (p : Person) (c : ComplaintText) : Prop
  | current  : PublicOfficialClass p c → OfficialOrFormerOrSelectedClass p c
  | former   : IsFormerPublicOfficial p c → OfficialOrFormerOrSelectedClass p c
  | selected : ∀ (o : Office) (s : SelectionEvent),
                 SelectedToBePublicOfficial p o s c →
                 OfficialOrFormerOrSelectedClass p c




inductive DutyOfOfficialClass (d : Duty) (p : Person) (c : ComplaintText) : Prop
  | lawfulDuty   : IsLawfulDutyOfOfficial d p c → DutyOfOfficialClass d p c
  | officialDuty : IsOfficialDutyOfOfficial d p c → DutyOfOfficialClass d p c



inductive ValueDestinationClass (p : Person) (e : Entity)
    (c : ComplaintText) : Prop
  | personally           : ActsInOfficialCapacity p c → ValueDestinationClass p e c
  | otherPersonOrEntity  : IsBeneficiaryEntity e c → ValueDestinationClass p e c


inductive OfficeKindClass (o : Office) (c : ComplaintText) : Prop
  | honor  : IsOfficeOfHonor o c → OfficeKindClass o c
  | trust  : IsOfficeOfTrust o c → OfficeKindClass o c
  | profit : IsOfficeOfProfit o c → OfficeKindClass o c



structure OfficeOfHonorTrustOrProfitUnderUnitedStates (o : Office)
    (c : ComplaintText) : Prop where
  kind    : OfficeKindClass o c
  underUS : IsUnderTheUnitedStates o c



inductive WitnessPaymentSafeHarborClass (v : ThingOfValue)
    (c : ComplaintText) : Prop
  | witnessFee          : IsWitnessFeeProvidedByLaw v c →
                            WitnessPaymentSafeHarborClass v c
  | travelAndSubsistence : IsReasonableCostOfTravelAndSubsistence v c →
                            WitnessPaymentSafeHarborClass v c
  | timeLost            : IsReasonableValueOfTimeLostInAttendance v c →
                            WitnessPaymentSafeHarborClass v c
  | expertFee           : IsReasonableFeeForPreparationOfExpertOpinion v c →
                            WitnessPaymentSafeHarborClass v c



structure PartyPaidWitnessExpense (v : ThingOfValue) (payer : Person)
    (w : Person) (pr : Proceeding) (c : ComplaintText) : Prop where
  payment : WitnessPaymentSafeHarborClass v c
  payer   : IsPartyUponWhoseBehalfWitnessIsCalled payer w c
  witness : IsWitnessUponProceeding w pr c



structure ExpertWitnessFee (v : ThingOfValue) (p : Person)
    (c : ComplaintText) : Prop where
  expert : IsExpertWitness p c
  fee    : IsReasonableFeeForPreparationOfExpertOpinion v c







structure ValueNotProvidedByLaw (v : ThingOfValue) (c : ComplaintText) : Prop where
  value           : IsAnythingOfValue v c
  notProvidedByLaw : ¬ ProvidedByLawForProperDischargeOfOfficialDuty v c




inductive WitnessObjectClass (p : Person) (pr : Proceeding) (t : Tribunal)
    (tst : Testimony) (c : ComplaintText) : Prop
  | testimony : TestimonyOfWitnessUnderOathOrAffirmation tst p pr t c →
                  WitnessObjectClass p pr t tst c
  | absence   : IsWitnessUponProceeding p pr c → AbsentsSelfFromProceeding p pr c →
                  QualifyingProceeding pr t c → WitnessObjectClass p pr t tst c





structure OfficialActPerformedOrToBePerformed (a : DecisionOrAction) (m : Matter)
    (p : Person) (t : Time) (c : ComplaintText) : Prop where
  act    : OfficialAct a m p c
  timing : PerformedOrToBePerformedAt a t c

end Proving.USC.T18.Ch11.EchoReslice.Ontology
