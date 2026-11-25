import Proving.USC.T18.Ch96.Elements.Types
set_option autoImplicit false
set_option relaxedAutoImplicit false










namespace Proving.USC.T18.Ch96.Elements

open Proving.USC.Common





axiom ChargeableUnderStateLaw (a : RacketeeringAct) (c : ComplaintText) : Prop



axiom IndictableUnderFederalPredicate (a : RacketeeringAct) (c : ComplaintText) : Prop



axiom IsLegalEntity (e : Enterprise) (c : ComplaintText) : Prop



axiom HasSharedPurpose (e : Enterprise) (c : ComplaintText) : Prop



axiom HasOngoingRelationships (e : Enterprise) (c : ComplaintText) : Prop



axiom HasLongevity (e : Enterprise) (c : ComplaintText) : Prop



axiom DistinctFromPattern (e : Enterprise) (c : ComplaintText) : Prop



axiom RacketeeringActCount (c : ComplaintText) : Nat



axiom OneActAfterEffectiveDate (c : ComplaintText) : Prop



axiom YearsBetweenPriorAndLastAct (c : ComplaintText) : Nat



axiom ActsAreRelated (acts : List RacketeeringAct) (c : ComplaintText) : Prop



axiom ActsShowContinuity (acts : List RacketeeringAct) (c : ComplaintText) : Prop



axiom DebtUnenforceableGamblingOrUsury (d : UnlawfulDebt) (c : ComplaintText) : Prop



axiom DebtInUnlawfulBusiness (d : UnlawfulDebt) (c : ComplaintText) : Prop





axiom CulpablePersonCapableOfIntent (p : Person) (c : ComplaintText) : Prop




axiom EngagedInInterstateCommerce (e : Enterprise) (c : ComplaintText) : Prop




axiom ReceivedIncomeFromPatternOrDebt (p : Person) (i : Income) (c : ComplaintText) : Prop



axiom ParticipatedAsPrincipal (p : Person) (c : ComplaintText) : Prop




axiom UsedOrInvestedIncomeInEnterprise (p : Person) (i : Income) (e : Enterprise) (c : ComplaintText) : Prop




axiom WithinSecuritiesSafeHarbor (p : Person) (c : ComplaintText) : Prop




axiom AcquiredOrMaintainedInterestOrControl (p : Person) (e : Enterprise) (c : ComplaintText) : Prop



axiom PersonEnterpriseDistinct (p : Person) (e : Enterprise) (c : ComplaintText) : Prop



axiom EmployedOrAssociated (p : Person) (e : Enterprise) (c : ComplaintText) : Prop




axiom ConductsOrParticipates (p : Person) (e : Enterprise) (c : ComplaintText) : Prop




axiom AgreementAmongTwoOrMore (p : Person) (c : ComplaintText) : Prop



axiom AgreedToViolateSubstantiveProvision (p : Person) (c : ComplaintText) : Prop




axiom ActedWithScienter (p : Person) (c : ComplaintText) : Prop





axiom InterestAcquiredOrMaintainedInViolation (pr : Property) (c : ComplaintText) : Prop




axiom InterestInEnterpriseConducted (pr : Property) (c : ComplaintText) : Prop



axiom ProceedsFromRacketeering (pr : Property) (c : ComplaintText) : Prop



axiom PetitionFiledWithinThirtyDays (c : ComplaintText) : Prop




axiom PetitionerHasVestedOrSuperiorInterest (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom PetitionerIsBonaFidePurchaser (p : Person) (pr : Property) (c : ComplaintText) : Prop






axiom OriginalPropertyUnavailableForForfeiture (pr : Property) (c : ComplaintText) : Prop





axiom InjuredInBusinessOrProperty (p : Person) (pr : Property) (c : ComplaintText) : Prop




axiom ProximateCause (p : Person) (c : ComplaintText) : Prop




axiom ReliesOnSecuritiesFraudConduct (p : Person) (c : ComplaintText) : Prop




axiom DefendantCriminallyConvictedOfFraud (p : Person) (c : ComplaintText) : Prop



axiom WithinLimitations (p : Person) (c : ComplaintText) : Prop





axiom FinalCriminalJudgmentEstopsDenial (c : ComplaintText) : Prop





axiom DefendantResidesInDistrict (p : Person) (c : ComplaintText) : Prop



axiom DefendantFoundInDistrict (p : Person) (c : ComplaintText) : Prop



axiom DefendantHasAgentInDistrict (p : Person) (c : ComplaintText) : Prop



axiom DefendantTransactsAffairsInDistrict (p : Person) (c : ComplaintText) : Prop




axiom EndsOfJusticeRequireOtherParties (c : ComplaintText) : Prop






axiom AttorneyGeneralCertifiesPublicImportance (c : ComplaintText) : Prop






axiom AttorneyGeneralReasonToBelievePossession (p : Person) (c : ComplaintText) : Prop




axiom DemandStatesNatureOfConduct (dem : Demand) (c : ComplaintText) : Prop



axiom DemandDescribesMaterial (dem : Demand) (c : ComplaintText) : Prop



axiom DemandStatesReturnDate (dem : Demand) (c : ComplaintText) : Prop



axiom DemandIdentifiesCustodian (dem : Demand) (c : ComplaintText) : Prop




axiom PetitionFiledWithinTwentyDays (c : ComplaintText) : Prop



axiom DemandFailsToComplyWithSection (dem : Demand) (c : ComplaintText) : Prop




axiom DemandViolatesLegalRightOrPrivilege (dem : Demand) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch96.Elements
