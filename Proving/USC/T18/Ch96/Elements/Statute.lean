import Proving.USC.T18.Ch96.Elements.Predicates
set_option autoImplicit false
set_option relaxedAutoImplicit false








namespace Proving.USC.T18.Ch96.Elements

open Proving.USC.Common





inductive IsRacketeeringActivity (a : RacketeeringAct) (c : ComplaintText) : Prop where
  | state   (h : ChargeableUnderStateLaw a c)
  | federal (h : IndictableUnderFederalPredicate a c)



structure AssociationInFact (e : Enterprise) (c : ComplaintText) : Prop where
  purpose       : HasSharedPurpose e c
  relationships : HasOngoingRelationships e c
  longevity     : HasLongevity e c
  distinct      : DistinctFromPattern e c



inductive EnterpriseUnder1961_4 (e : Enterprise) (c : ComplaintText) : Prop where
  | legalEntity (h : IsLegalEntity e c)
  | aif         (h : AssociationInFact e c)


abbrev IsEnterprise (e : Enterprise) (c : ComplaintText) : Prop := EnterpriseUnder1961_4 e c




structure PatternOfRacketeering (acts : List RacketeeringAct) (c : ComplaintText) : Prop where
  atLeastTwoActs        : 2 ≤ RacketeeringActCount c
  oneAfterEffectiveDate : OneActAfterEffectiveDate c
  withinTenYears        : YearsBetweenPriorAndLastAct c ≤ 10
  related               : ActsAreRelated acts c
  continuity            : ActsShowContinuity acts c



structure IsUnlawfulDebt (d : UnlawfulDebt) (c : ComplaintText) : Prop where
  gamblingOrUsury : DebtUnenforceableGamblingOrUsury d c
  unlawfulBusiness : DebtInUnlawfulBusiness d c



inductive PatternOrUnlawfulDebt (acts : List RacketeeringAct) (d : UnlawfulDebt) (c : ComplaintText) : Prop where
  | pattern      (h : PatternOfRacketeering acts c)
  | unlawfulDebt (h : IsUnlawfulDebt d c)






structure Section1962a (p : Person) (i : Income) (e : Enterprise) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  income             : ReceivedIncomeFromPatternOrDebt p i c
  principal          : ParticipatedAsPrincipal p c
  invested           : UsedOrInvestedIncomeInEnterprise p i e c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  notSafeHarbor      : ¬ WithinSecuritiesSafeHarbor p c



structure Section1962b (p : Person) (e : Enterprise) (acts : List RacketeeringAct)
    (d : UnlawfulDebt) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  acquiredControl    : AcquiredOrMaintainedInterestOrControl p e c
  predicateBasis     : PatternOrUnlawfulDebt acts d c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c



structure Section1962c (p : Person) (e : Enterprise) (acts : List RacketeeringAct)
    (d : UnlawfulDebt) (c : ComplaintText) : Prop where
  culpable           : CulpablePersonCapableOfIntent p c
  enterprise         : IsEnterprise e c
  interstateCommerce : EngagedInInterstateCommerce e c
  distinct           : PersonEnterpriseDistinct p e c
  associated         : EmployedOrAssociated p e c
  conducts           : ConductsOrParticipates p e c
  predicateBasis     : PatternOrUnlawfulDebt acts d c


structure Section1962d (p : Person) (c : ComplaintText) : Prop where
  culpable        : CulpablePersonCapableOfIntent p c
  agreement       : AgreementAmongTwoOrMore p c
  agreedToViolate : AgreedToViolateSubstantiveProvision p c
  scienter        : ActedWithScienter p c



inductive ViolationOfSection1962 (p : Person) (e : Enterprise) (i : Income)
    (acts : List RacketeeringAct) (d : UnlawfulDebt) (c : ComplaintText) : Prop where
  | subA (h : Section1962a p i e c)
  | subB (h : Section1962b p e acts d c)
  | subC (h : Section1962c p e acts d c)
  | subD (h : Section1962d p c)




inductive ForfeitableProperty (pr : Property) (c : ComplaintText) : Prop where
  | acquiredInterest   (h : InterestAcquiredOrMaintainedInViolation pr c)
  | enterpriseInterest (h : InterestInEnterpriseConducted pr c)
  | proceeds           (h : ProceedsFromRacketeering pr c)



structure CriminalForfeiture (p : Person) (e : Enterprise) (i : Income)
    (acts : List RacketeeringAct) (d : UnlawfulDebt) (pr : Property) (c : ComplaintText) : Prop where
  violation   : ViolationOfSection1962 p e i acts d c
  forfeitable : ForfeitableProperty pr c



inductive PetitionerInterest (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  | vestedSuperior (h : PetitionerHasVestedOrSuperiorInterest p pr c)
  | bonaFide       (h : PetitionerIsBonaFidePurchaser p pr c)



structure ValidThirdPartyPetition (p : Person) (pr : Property) (c : ComplaintText) : Prop where
  timely   : PetitionFiledWithinThirtyDays c
  interest : PetitionerInterest p pr c



structure SubstituteAssetForfeiture (p : Person) (e : Enterprise) (i : Income)
    (acts : List RacketeeringAct) (d : UnlawfulDebt) (pr : Property) (c : ComplaintText) : Prop where
  forfeiture  : CriminalForfeiture p e i acts d pr c
  unavailable : OriginalPropertyUnavailableForForfeiture pr c




structure EquitableRicoClaim (p : Person) (e : Enterprise) (i : Income)
    (acts : List RacketeeringAct) (d : UnlawfulDebt) (c : ComplaintText) : Prop where
  violation : ViolationOfSection1962 p e i acts d c




inductive SecuritiesFraudBarOvercome (p : Person) (c : ComplaintText) : Prop where
  | noReliance (h : ¬ ReliesOnSecuritiesFraudConduct p c)
  | convicted  (h : DefendantCriminallyConvictedOfFraud p c)


structure ValidCivilRicoClaim (plaintiff defendant : Person) (e : Enterprise) (i : Income)
    (acts : List RacketeeringAct) (d : UnlawfulDebt) (pr : Property) (c : ComplaintText) : Prop where
  violation : ViolationOfSection1962 defendant e i acts d c
  injury    : InjuredInBusinessOrProperty plaintiff pr c
  causation : ProximateCause plaintiff c
  notBarred : SecuritiesFraudBarOvercome plaintiff c
  timely    : WithinLimitations plaintiff c




inductive ProperVenue (p : Person) (c : ComplaintText) : Prop where
  | resides   (h : DefendantResidesInDistrict p c)
  | found     (h : DefendantFoundInDistrict p c)
  | hasAgent  (h : DefendantHasAgentInDistrict p c)
  | transacts (h : DefendantTransactsAffairsInDistrict p c)





structure ValidCivilInvestigativeDemand (p : Person) (dem : Demand) (c : ComplaintText) : Prop where
  reasonToBelieve    : AttorneyGeneralReasonToBelievePossession p c
  statesNature       : DemandStatesNatureOfConduct dem c
  describesMaterial  : DemandDescribesMaterial dem c
  statesReturnDate   : DemandStatesReturnDate dem c
  identifiesCustodian : DemandIdentifiesCustodian dem c


inductive CIDPetitionGround (dem : Demand) (c : ComplaintText) : Prop where
  | nonCompliance (h : DemandFailsToComplyWithSection dem c)
  | privilege     (h : DemandViolatesLegalRightOrPrivilege dem c)



structure ValidCIDPetition (dem : Demand) (c : ComplaintText) : Prop where
  timely : PetitionFiledWithinTwentyDays c
  ground : CIDPetitionGround dem c

end Proving.USC.T18.Ch96.Elements
