import Proving.USC.T42.Ch6ASchI.Part2.Deontic.Types
import Proving.USC.Common.Types









namespace Proving.USC.T42.Ch6ASchI.Part2.Deontic

open Proving.USC.Common





axiom AddresseeQualifiedOfficer211 (o : Officer) (c : ComplaintText) : Prop




axiom CompletedRequiredServiceYears211 (o : Officer) (c : ComplaintText) : Prop




axiom PermanentPromotionGiven211 (o : Officer) (c : ComplaintText) : Prop



axiom AddresseeOfficerRegularCorps211 (o : Officer) (c : ComplaintText) : Prop




axiom LacksOneYearInNextLowerGrade211 (o : Officer) (c : ComplaintText) : Prop




axiom PromotedToRestrictedOrDirectorGrade211 (o : Officer) (c : ComplaintText) : Prop







axiom AddresseeQualifyingMedicalOfficer211c (o : Officer) (c : ComplaintText) : Prop




axiom NoSimilarCreditReceived211c (o : Officer) (c : ComplaintText) : Prop




axiom OneYearPromotionCreditGiven211c (o : Officer) (c : ComplaintText) : Prop





axiom AddresseeOfficerRegularCorps212 (o : Officer) (c : ComplaintText) : Prop




axiom officerAgeYears212 (o : Officer) (c : ComplaintText) : Nat



axiom AppliedForRetirement212 (o : Officer) (c : ComplaintText) : Prop




axiom RetiredOnApplication212 (o : Officer) (c : ComplaintText) : Prop




axiom yearsActiveService212 (o : Officer) (c : ComplaintText) : Nat






axiom AddresseeCommissionedOfficer213 (o : Officer) (c : ComplaintText) : Prop




axiom ServedInTimeOfWar213 (o : Officer) (c : ComplaintText) : Prop





axiom ServedOnDetailWithArmedForces213 (o : Officer) (c : ComplaintText) : Prop





axiom ServedWhileServiceInMilitaryForces213 (o : Officer) (c : ComplaintText) : Prop




axiom MilitaryBenefitsAccorded213 (o : Officer) (c : ComplaintText) : Prop





axiom PresidentAuthorizedRibbonConditions213 (c : ComplaintText) : Prop






axiom AddresseeCommissionedOfficer213a (o : Officer) (c : ComplaintText) : Prop





axiom Title10RightsAccorded213a (o : Officer) (c : ComplaintText) : Prop






axiom AddresseeReleasedForRetirement214 (o : Officer) (c : ComplaintText) : Prop




axiom PreviouslyPresentedFlag214 (o : Officer) (c : ComplaintText) : Prop




axiom FlagPresented214 (o : Officer) (c : ComplaintText) : Prop






axiom RequestByExecutiveDepartmentHead215 (c : ComplaintText) : Prop




axiom PersonnelDetailed215 (o : Officer) (c : ComplaintText) : Prop







axiom RegulatoryMatterUnderTitle216 (c : ComplaintText) : Prop




axiom PresidentPrescribedRegulations216 (c : ComplaintText) : Prop





axiom RelatesToMedicalOfficerQualifications216 (r : Regulation) (c : ComplaintText) : Prop




axiom GivesPreferenceToSchoolOfMedicine216 (r : Regulation) (c : ComplaintText) : Prop







axiom InTimeOfWarOrEmergencyProclaimed217 (c : ComplaintText) : Prop




axiom PresidentDeclaredCorpsMilitaryService217 (c : ComplaintText) : Prop






axiom ForPurposeOfAdvisingSecretary217a (c : ComplaintText) : Prop




axiom SecretaryAppointedAdvisoryCouncil217a (a : AdvisoryCommittee) (c : ComplaintText) : Prop







axiom AppointmentToCoveredAdvisoryCommittee217a1 (a : AdvisoryCommittee) (c : ComplaintText) : Prop




axiom ConsideredPoliticalAffiliation217a1 (a : AdvisoryCommittee) (c : ComplaintText) : Prop

end Proving.USC.T42.Ch6ASchI.Part2.Deontic
