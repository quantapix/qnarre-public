import Proving.USC.T18.Ch11.Reslice.Deontic.Types
import Proving.USC.Common.Types
set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Deontic

open Proving.USC.Common



axiom AddresseeAnyPerson (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsPublicOfficial (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsPublicOfficialOrOfferor201 (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsFederalOfficerOrEmployee (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsMemberOfCongress (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsFormerFederalOfficer (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsFinancialInstitutionInsider (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsFinancialInstitutionInsiderOrOfferor215 (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsFinancialInstitutionExaminer (p : Person) (c : ComplaintText) : Prop



axiom AddresseeIsCoveredGovernmentPerson (p : Person) (c : ComplaintText) : Prop



axiom CorruptlyExchangedThingOfValue201b (p : Person) (c : ComplaintText) : Prop



axiom ExchangedThingOfValueForOfficialAct201c (p : Person) (c : ComplaintText) : Prop



axiom SoughtOrReceivedCompensationForRepresentation203 (p : Person) (c : ComplaintText) : Prop



axiom PracticedBeforeFederalClaimsOrCircuitCourt204 (p : Person) (c : ComplaintText) : Prop



axiom ActedAsAgentOrAttorneyAgainstUS205 (p : Person) (c : ComplaintText) : Prop



axiom MadeInfluenceCommunicationPostEmployment207 (p : Person) (c : ComplaintText) : Prop



axiom ParticipatedPersonallyAndSubstantially208 (p : Person) (c : ComplaintText) : Prop



axiom ReceivedSalaryFromNonUSSource209 (p : Person) (c : ComplaintText) : Prop



axiom OfferedValueToProcureAppointiveOffice210 (p : Person) (c : ComplaintText) : Prop



axiom SolicitedValueToObtainAppointiveOffice211 (p : Person) (c : ComplaintText) : Prop



axiom MadeLoanOrGratuityToExaminer212 (p : Person) (c : ComplaintText) : Prop



axiom AcceptedLoanOrGratuityWhileExaminer213 (p : Person) (c : ComplaintText) : Prop



axiom TookFeeForProcuringFederalReserveLoan214 (p : Person) (c : ComplaintText) : Prop



axiom CorruptlyExchangedValueForBankBusiness215 (p : Person) (c : ComplaintText) : Prop



axiom AcceptedConsiderationForFarmDebtAdjustment217 (p : Person) (c : ComplaintText) : Prop



axiom ActedAsUnregisteredForeignAgent219 (p : Person) (c : ComplaintText) : Prop



axiom KnowinglyPaidOrSolicitedReferralRemuneration220 (p : Person) (c : ComplaintText) : Prop



axiom SchemeToBribeSportingContest224 (p : Person) (c : ComplaintText) : Prop



axiom OrganizedContinuingFinancialCrimesEnterprise225 (p : Person) (c : ComplaintText) : Prop



axiom KnowinglyCorruptBriberyAffectingPortSecurity226 (p : Person) (c : ComplaintText) : Prop



axiom UsedOfficialActToInfluencePrivateEmployment227 (p : Person) (c : ComplaintText) : Prop



axiom IntentToInfluenceOfficialAct201b (p : Person) (c : ComplaintText) : Prop



axiom MatterInWhichUSHasInterest203 (c : ComplaintText) : Prop



axiom CoveredMatterUSInterest205 (c : ComplaintText) : Prop



axiom ParticularMatterPriorParticipation207 (p : Person) (c : ComplaintText) : Prop



axiom PersonalFinancialInterestKnown208 (p : Person) (c : ComplaintText) : Prop



axiom FeeNotDisclosedInWriting214 (c : ComplaintText) : Prop



axiom HealthProgramInterstateCommerce220 (c : ComplaintText) : Prop



axiom SchemeInInterstateCommerce224 (c : ComplaintText) : Prop



axiom ReceivedFiveMillionOver24Months225 (p : Person) (c : ComplaintText) : Prop



axiom TerrorismPurposeAffectingSeaport226 (p : Person) (c : ComplaintText) : Prop



axiom PartisanPoliticalBasis227 (p : Person) (c : ComplaintText) : Prop



axiom ObligorIsOfficeOfGovernmentEthics (p : Person) (c : ComplaintText) : Prop



axiom IssuedUniformWaiverRegulations208d2 (p : Person) (c : ComplaintText) : Prop



axiom ObligorIsFinancialRegulatoryAgency (p : Person) (c : ComplaintText) : Prop



axiom EstablishedAndPublishedComplianceGuidelines215d (p : Person) (c : ComplaintText) : Prop



axiom ObligorIsSection207WaiverRecipient (p : Person) (c : ComplaintText) : Prop



axiom FiledSemiannualWaiverActivityReport207k5 (p : Person) (c : ComplaintText) : Prop



axiom PowerHolderIsAttorneyGeneral (p : Person) (c : ComplaintText) : Prop



axiom PowerHolderIsPresident (p : Person) (c : ComplaintText) : Prop



axiom PowerHolderIsPresidentOrAgencyHead (p : Person) (c : ComplaintText) : Prop



axiom PowerHolderIsFinancialRegulatoryAgency (p : Person) (c : ComplaintText) : Prop



axiom OffenseConductPresent216 (p : Person) (c : ComplaintText) : Prop



axiom FinalConvictionForChapterViolation218 (p : Person) (c : ComplaintText) : Prop



axiom PublicInterestAndCriticalNeed207k1 (p : Person) (c : ComplaintText) : Prop



axiom WitnessFeesAndCostsPermitted201d (p : Person) (c : ComplaintText) : Prop



axiom RetiredUniformedOfficerExempt206 (p : Person) (c : ComplaintText) : Prop



axiom FinancialInterestExemptionApplies208b (p : Person) (c : ComplaintText) : Prop



axiom BonaFideBenefitPlanPermitted209b (p : Person) (c : ComplaintText) : Prop



axiom OfficialDutyActivityExempt207j (p : Person) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch11.Reslice.Deontic