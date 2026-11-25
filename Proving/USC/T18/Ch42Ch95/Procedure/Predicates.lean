






import Proving.USC.T18.Ch42Ch95.Procedure.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

namespace Proving.USC.T18.Ch42Ch95.Procedure

open Proving.USC.Common








axiom ProsecutionUnderSection892 (pr : Prosecution) (c : ComplaintText) : Prop







axiom RepaymentUnenforceableInDebtorJurisdiction (pr : Prosecution) (c : ComplaintText) : Prop






axiom annualInterestRatePercent (pr : Prosecution) (c : ComplaintText) : Nat






axiom DebtorReasonablyBelievedExtortionateHistory (pr : Prosecution) (c : ComplaintText) : Prop






axiom outstandingCreditTotalDollars (pr : Prosecution) (c : ComplaintText) : Nat





axiom EvidenceOf892b1Or892b2Introduced (pr : Prosecution) (c : ComplaintText) : Prop




axiom DirectEvidenceOfDebtorBeliefUnavailable (pr : Prosecution) (c : ComplaintText) : Prop






axiom DebtorWasMemberOfCommunityAtExtension (pr : Prosecution) (c : ComplaintText) : Prop






axiom CourtAllowedCreditorReputationEvidence (pr : Prosecution) (c : ComplaintText) : Prop






axiom ProsecutionUnderSection894 (pr : Prosecution) (c : ComplaintText) : Prop





axiom ImplicitThreatAllegedAsMeansOfCollection (pr : Prosecution) (c : ComplaintText) : Prop






axiom EvidenceOfKnownExtortionateCollectionHistory (pr : Prosecution) (c : ComplaintText) : Prop





axiom EvidenceOf892bCircumstancesAtExtension (pr : Prosecution) (c : ComplaintText) : Prop





axiom CommunicationShownEmployedAsCollectionMeans (pr : Prosecution) (c : ComplaintText) : Prop





axiom ThreatTargetWasMemberOfCommunityAtCollection (pr : Prosecution) (c : ComplaintText) : Prop




axiom CourtAllowedDefendantReputationEvidence (pr : Prosecution) (c : ComplaintText) : Prop






axiom InvestigationUnderSection1952 (inv : Investigation) (c : ComplaintText) : Prop




axiom InvestigationInvolvesLiquor (inv : Investigation) (c : ComplaintText) : Prop





axiom ConductedUnderAttorneyGeneralSupervision (inv : Investigation) (c : ComplaintText) : Prop






axiom SavingsPromotionRaffleByInsuredInstitution (pr : Prosecution) (c : ComplaintText) : Prop







axiom ProsecutionUnderSection1956Or1957 (pr : Prosecution) (c : ComplaintText) : Prop






axiom ChargingInstrumentReturned (pr : Prosecution) (c : ComplaintText) : Prop






axiom SuaIsForeignNationOffense (pr : Prosecution) (c : ComplaintText) : Prop




axiom offenseCommittedDay (pr : Prosecution) (c : ComplaintText) : Nat





axiom chargingInstrumentDay (pr : Prosecution) (c : ComplaintText) : Nat




axiom TransactionConductedInDistrict (pr : Prosecution) (d : District) (c : ComplaintText) : Prop




axiom UnderlyingSuaProsecutableInDistrict (pr : Prosecution) (d : District) (c : ComplaintText) : Prop





axiom DefendantParticipatedInTransferFromDistrict (pr : Prosecution) (d : District) (c : ComplaintText) : Prop




axiom IsAttemptOrConspiracyOffense (pr : Prosecution) (c : ComplaintText) : Prop




axiom ActInFurtheranceOccurredInDistrict (pr : Prosecution) (d : District) (c : ComplaintText) : Prop





axiom PortionOfContinuingTransactionInDistrict (pr : Prosecution) (d : District) (c : ComplaintText) : Prop



axiom ConductByUnitedStatesCitizen (pr : Prosecution) (c : ComplaintText) : Prop




axiom ConductOccursInPartInUnitedStates (pr : Prosecution) (c : ComplaintText) : Prop





axiom transactionValueDollars (pr : Prosecution) (c : ComplaintText) : Nat





axiom CivilPenaltyActionFiled (ca : CivilPenaltyAction) (c : ComplaintText) : Prop





axiom DefendantIsForeignPerson (p : Person) (ca : CivilPenaltyAction) (c : ComplaintText) : Prop





axiom ServiceOfProcessMadeOnForeignPerson (p : Person) (ca : CivilPenaltyAction) (c : ComplaintText) : Prop





axiom ForeignPersonOffenseInvolvingUsTransaction (p : Person) (ca : CivilPenaltyAction) (c : ComplaintText) : Prop





axiom ForeignPersonConvertedForfeitedUsProperty (p : Person) (ca : CivilPenaltyAction) (c : ComplaintText) : Prop




axiom ForeignInstitutionMaintainsUsBankAccount (p : Person) (ca : CivilPenaltyAction) (c : ComplaintText) : Prop





axiom CourtIssuedPretrialRestrainingOrder (ca : CivilPenaltyAction) (c : ComplaintText) : Prop




axiom ReceiverApplicationByAuthorizedOfficial (ra : ReceivershipApplication) (c : ComplaintText) : Prop




axiom AppointingCourtHasJurisdictionOverDefendant (ra : ReceivershipApplication) (c : ComplaintText) : Prop





axiom FederalReceiverAppointed (ra : ReceivershipApplication) (c : ComplaintText) : Prop






axiom InvestigationDirectedByNamedOfficer (inv : Investigation) (c : ComplaintText) : Prop





axiom InvestigatingComponentIsNonJustice (inv : Investigation) (c : ComplaintText) : Prop






axiom InteragencyInvestigativeAgreementInEffect (inv : Investigation) (c : ComplaintText) : Prop





axiom FinancialInstitutionFoundGuilty (n : RegulatoryNotification) (c : ComplaintText) : Prop




axiom AttorneyGeneralGaveWrittenNotice (n : RegulatoryNotification) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch42Ch95.Procedure
