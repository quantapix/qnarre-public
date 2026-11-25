




import Proving.USC.T18.Ch42Ch95.Procedure.Types
import Proving.USC.T18.Ch42Ch95.Procedure.Predicates
import Proving.USC.T18.Ch42Ch95.Procedure.Statute
import Proving.USC.Common.Types

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Procedure

open Proving.USC.Common




theorem primaFacieShowing892b_intro
    {pr : Prosecution} {c : ComplaintText}
    (hIn : ProsecutionUnderSection892 pr c)
    (hUnenf : RepaymentUnenforceableInDebtorJurisdiction pr c)
    (hRate : RateExceedsStatutoryThreshold pr c)
    (hBelief : DebtorReasonablyBelievedExtortionateHistory pr c)
    (hOut : OutstandingCreditExceedsThreshold pr c) :
    PrimaFacieShowing892b pr c :=
  ⟨hIn, hUnenf, hRate, hBelief, hOut⟩


theorem reputationEvidenceAdmitted892c_intro
    {pr : Prosecution} {c : ComplaintText}
    (hIn : ProsecutionUnderSection892 pr c)
    (hEvid : EvidenceOf892b1Or892b2Introduced pr c)
    (hNoDirect : DirectEvidenceOfDebtorBeliefUnavailable pr c)
    (hCommunity : DebtorWasMemberOfCommunityAtExtension pr c)
    (hAllowed : CourtAllowedCreditorReputationEvidence pr c) :
    ReputationEvidenceAdmitted892c pr c :=
  ⟨hIn, hEvid, hNoDirect, hCommunity, hAllowed⟩




theorem implicitThreatEvidence894b_intro
    {pr : Prosecution} {c : ComplaintText}
    (hIn : ProsecutionUnderSection894 pr c)
    (hPurpose : ImplicitThreatAllegedAsMeansOfCollection pr c)
    (hHistory : EvidenceOfKnownExtortionateCollectionHistory pr c) :
    ImplicitThreatEvidence894b pr c :=
  ⟨hIn, hPurpose, hHistory⟩


theorem reputationEvidenceAdmitted894c_intro
    {pr : Prosecution} {c : ComplaintText}
    (hIn : ProsecutionUnderSection894 pr c)
    (hEvid : EvidenceOf892bCircumstancesAtExtension pr c)
    (hNoDirect : DirectEvidenceOfDebtorBeliefUnavailable pr c)
    (hComm : CommunicationShownEmployedAsCollectionMeans pr c)
    (hCommunity : ThreatTargetWasMemberOfCommunityAtCollection pr c)
    (hAllowed : CourtAllowedDefendantReputationEvidence pr c) :
    ReputationEvidenceAdmitted894c pr c :=
  ⟨hIn, hEvid, hNoDirect, hComm, hCommunity, hAllowed⟩




theorem liquorInvestigationSupervised1952c_intro
    {inv : Investigation} {c : ComplaintText}
    (hUnder : InvestigationUnderSection1952 inv c)
    (hLiquor : InvestigationInvolvesLiquor inv c)
    (hSup : ConductedUnderAttorneyGeneralSupervision inv c) :
    LiquorInvestigationSupervised1952c inv c :=
  ⟨hUnder, hLiquor, hSup⟩



theorem section1952ProsecutionAvailable_intro
    {pr : Prosecution} {c : ComplaintText}
    (hNot : ¬ SavingsPromotionRaffleByInsuredInstitution pr c) :
    Section1952ProsecutionAvailable pr c :=
  ⟨hNot⟩




theorem timelyCharge1956j_intro
    {pr : Prosecution} {c : ComplaintText}
    (hUnder : ProsecutionUnderSection1956Or1957 pr c)
    (hForeign : SuaIsForeignNationOffense pr c)
    (hCharged : ChargingInstrumentReturned pr c)
    (hTimely : WithinSevenYearWindow pr c) :
    TimelyCharge1956j pr c :=
  ⟨hUnder, hForeign, hCharged, hTimely⟩



theorem withinSevenYearWindow_intro
    {pr : Prosecution} {c : ComplaintText}
    (hOrder : ChargeNotBeforeOffense pr c)
    (hSpan : daysFromOffenseToCharge pr c ≤ sevenYearWindowDays) :
    WithinSevenYearWindow pr c :=
  ⟨hOrder, hSpan⟩



theorem sevenYearBarHasRun_intro
    {pr : Prosecution} {c : ComplaintText}
    (hForeign : SuaIsForeignNationOffense pr c)
    (hLate : ¬ WithinSevenYearWindow pr c) :
    SevenYearBarHasRun pr c :=
  ⟨hForeign, hLate⟩


theorem extraterritorialJurisdiction1956f_intro
    {pr : Prosecution} {c : ComplaintText}
    (hActor : ConductByUnitedStatesCitizen pr c ∨ ConductOccursInPartInUnitedStates pr c)
    (hValue : TransactionValueExceedsThreshold pr c) :
    ExtraterritorialJurisdiction1956f pr c :=
  ⟨hActor, hValue⟩


theorem venueProper1956i_intro
    {pr : Prosecution} {d : District} {c : ComplaintText}
    (h : TransactionConductedInDistrict pr d c) :
    VenueProper1956i pr d c :=
  VenueProper1956i.transactionDistrict h


theorem venueProper1956i_intro_suaTransfer
    {pr : Prosecution} {d : District} {c : ComplaintText}
    (hSua : UnderlyingSuaProsecutableInDistrict pr d c)
    (hTransfer : DefendantParticipatedInTransferFromDistrict pr d c) :
    VenueProper1956i pr d c :=
  VenueProper1956i.suaTransferDistrict hSua hTransfer



theorem venueProper1956i_intro_inchoate
    {pr : Prosecution} {d : District} {c : ComplaintText}
    (hInchoate : IsAttemptOrConspiracyOffense pr c)
    (hAct : ActInFurtheranceOccurredInDistrict pr d c) :
    VenueProper1956i pr d c :=
  VenueProper1956i.inchoateFurtherance hInchoate hAct



theorem venueProper1956i_intro_continuing
    {pr : Prosecution} {d : District} {c : ComplaintText}
    (h : PortionOfContinuingTransactionInDistrict pr d c) :
    VenueProper1956i pr d c :=
  VenueProper1956i.continuingTransaction h


theorem reachable1956_intro
    {pr : Prosecution} {c : ComplaintText}
    (h : ProsecutionUnderSection1956Or1957 pr c) :
    Reachable1956 pr c ProsecutionState.Uncharged :=
  Reachable1956.start h


theorem reachable1956_intro_charged
    {pr : Prosecution} {c : ComplaintText}
    (hPrev : Reachable1956 pr c ProsecutionState.Uncharged)
    (hTimely : TimelyCharge1956j pr c) :
    Reachable1956 pr c ProsecutionState.Charged :=
  Reachable1956.charge hPrev hTimely


theorem reachable1956_intro_venueLaid
    {pr : Prosecution} {d : District} {c : ComplaintText}
    (hPrev : Reachable1956 pr c ProsecutionState.Charged)
    (hVenue : VenueProper1956i pr d c) :
    Reachable1956 pr c ProsecutionState.VenueLaid :=
  Reachable1956.layVenue hPrev hVenue



theorem reachable1956_intro_timeBarred
    {pr : Prosecution} {c : ComplaintText}
    (hPrev : Reachable1956 pr c ProsecutionState.Uncharged)
    (hBar : SevenYearBarHasRun pr c) :
    Reachable1956 pr c ProsecutionState.TimeBarred :=
  Reachable1956.timeBar hPrev hBar




theorem foreignPersonJurisdictionBasis1956b2_intro
    {p : Person} {ca : CivilPenaltyAction} {c : ComplaintText}
    (h : ForeignPersonOffenseInvolvingUsTransaction p ca c) :
    ForeignPersonJurisdictionBasis1956b2 p ca c :=
  ForeignPersonJurisdictionBasis1956b2.usTransactionOffense h



theorem foreignPersonJurisdictionBasis1956b2_intro_converted
    {p : Person} {ca : CivilPenaltyAction} {c : ComplaintText}
    (h : ForeignPersonConvertedForfeitedUsProperty p ca c) :
    ForeignPersonJurisdictionBasis1956b2 p ca c :=
  ForeignPersonJurisdictionBasis1956b2.convertedForfeitedProperty h



theorem foreignPersonJurisdictionBasis1956b2_intro_usAccount
    {p : Person} {ca : CivilPenaltyAction} {c : ComplaintText}
    (h : ForeignInstitutionMaintainsUsBankAccount p ca c) :
    ForeignPersonJurisdictionBasis1956b2 p ca c :=
  ForeignPersonJurisdictionBasis1956b2.maintainsUsAccount h


theorem personalJurisdictionOverForeignPerson1956b2_intro
    {p : Person} {ca : CivilPenaltyAction} {c : ComplaintText}
    (hFiled : CivilPenaltyActionFiled ca c)
    (hForeign : DefendantIsForeignPerson p ca c)
    (hServed : ServiceOfProcessMadeOnForeignPerson p ca c)
    (hBasis : ForeignPersonJurisdictionBasis1956b2 p ca c) :
    PersonalJurisdictionOverForeignPerson1956b2 p ca c :=
  ⟨hFiled, hForeign, hServed, hBasis⟩


theorem assetsSecured1956b3_intro
    {ca : CivilPenaltyAction} {c : ComplaintText}
    (hFiled : CivilPenaltyActionFiled ca c)
    (hOrder : CourtIssuedPretrialRestrainingOrder ca c) :
    AssetsSecured1956b3 ca c :=
  ⟨hFiled, hOrder⟩


theorem federalReceiverAppointment1956b4_intro
    {ra : ReceivershipApplication} {c : ComplaintText}
    (hApp : ReceiverApplicationByAuthorizedOfficial ra c)
    (hCourt : AppointingCourtHasJurisdictionOverDefendant ra c)
    (hAppointed : FederalReceiverAppointed ra c) :
    FederalReceiverAppointment1956b4 ra c :=
  ⟨hApp, hCourt, hAppointed⟩




theorem nonJusticeInvestigationAuthorized1956e_intro
    {inv : Investigation} {c : ComplaintText}
    (hNonJustice : InvestigatingComponentIsNonJustice inv c)
    (hDirected : InvestigationDirectedByNamedOfficer inv c)
    (hAgreement : InteragencyInvestigativeAgreementInEffect inv c) :
    NonJusticeInvestigationAuthorized1956e inv c :=
  ⟨hNonJustice, hDirected, hAgreement⟩


theorem regulatorNotified1956g_intro
    {n : RegulatoryNotification} {c : ComplaintText}
    (hTrigger : FinancialInstitutionFoundGuilty n c)
    (hNotice : AttorneyGeneralGaveWrittenNotice n c) :
    RegulatorNotified1956g n c :=
  ⟨hTrigger, hNotice⟩

end Proving.USC.T18.Ch42Ch95.Procedure
