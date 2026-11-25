


















import Proving.USC.T18.Ch73.Reslice.Elements.Types
import Proving.USC.T18.Ch73.Reslice.Elements.Predicates
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText Entity Agreement ActedWithScienter
  ProximateCause AgreementAmongTwoOrMore EngagedInInterstateCommerce)

namespace Proving.USC.T18.Ch73.Reslice.Elements






inductive OfficialProceeding1515a1 (pr : OfficialProceeding) (c : ComplaintText) : Prop where
  | judicial (h : IsFederalJudicialOrGrandJuryProceeding pr c)
  | congressional (h : IsCongressionalProceeding pr c)
  | agency (h : IsAuthorizedFederalAgencyProceeding pr c)
  | insurance (e : Entity) (h : IsInsuranceRegulatoryProceeding pr c)
      (hc : EngagedInInterstateCommerce e c)



abbrev IsOfficialProceeding (pr : OfficialProceeding) (c : ComplaintText) : Prop :=
  OfficialProceeding1515a1 pr c


inductive MisleadingConduct1515a3 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | falseStatement (h : KnowinglyMakesFalseStatement d v c)
  | omissionOrConcealment (h : IntentionallyOmitsOrConcealsMaterialFact d v c)
  | falseWriting (h : InvitesRelianceOnFalseWriting d v c)
  | misleadingObject (h : InvitesRelianceOnMisleadingObject d v c)
  | trickSchemeOrDevice (h : KnowinglyUsesTrickSchemeOrDevice d v c)



abbrev EngagesInMisleadingConduct (d : Person) (v : Person) (c : ComplaintText) : Prop :=
  MisleadingConduct1515a3 d v c




inductive KillingConduct1512a1 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | kills (h : KillsAnotherPerson d v c)
  | attempts (h : AttemptsToKillAnotherPerson d v c)




inductive KillingIntent1512a1 (d : Person) (pr : OfficialProceeding) (o : Person)
    (c : ComplaintText) : Prop where
  | preventAttendanceOrTestimony (hp : IsOfficialProceeding pr c)
      (h : IntentToPreventAttendanceOrTestimony d pr c)
  | preventProduction (hp : IsOfficialProceeding pr c)
      (h : IntentToPreventProductionOfRecord d pr c)
  | preventCommunication (ho : IsFederalLawEnforcementOfficerOrJudge o c)
      (h : IntentToPreventCommunicationToFederalOfficer d o c)


structure Section1512a1 (d : Person) (v : Person) (pr : OfficialProceeding) (o : Person)
    (c : ComplaintText) : Prop where
  conduct : KillingConduct1512a1 d v c
  intent : KillingIntent1512a1 d pr o c





inductive TamperingIntent1512 (d : Person) (pr : OfficialProceeding) (o : Person)
    (c : ComplaintText) : Prop where
  | influenceTestimony (hp : IsOfficialProceeding pr c)
      (h : IntentToInfluenceDelayOrPreventTestimony d pr c)
  | causeWithholding (hp : IsOfficialProceeding pr c)
      (h : IntentToCauseWithholdingOfTestimonyOrObject d pr c)
  | causeObjectImpairment (hp : IsOfficialProceeding pr c)
      (h : IntentToCauseObjectImpairment d pr c)
  | causeEvasion (hp : IsOfficialProceeding pr c)
      (h : IntentToCauseEvasionOfLegalProcess d pr c)
  | causeAbsence (hp : IsOfficialProceeding pr c)
      (h : IntentToCauseAbsenceFromProceeding d pr c)
  | hinderCommunication (ho : IsFederalLawEnforcementOfficerOrJudge o c)
      (h : IntentToHinderCommunicationToFederalOfficer d o c)



inductive ForceConduct1512a2 (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | uses (h : UsesPhysicalForce d v c)
  | threatens (h : ThreatensPhysicalForce d v c)
  | attempts (h : AttemptsPhysicalForceOrThreat d v c)


structure Section1512a2 (d : Person) (v : Person) (pr : OfficialProceeding) (o : Person)
    (c : ComplaintText) : Prop where
  conduct : ForceConduct1512a2 d v c
  intent : TamperingIntent1512 d pr o c





inductive TamperingConduct1512b (d : Person) (v : Person) (c : ComplaintText) : Prop where
  | intimidation (h : UsesIntimidation d v c)
  | threat (h : ThreatensAnotherPerson d v c)
  | corruptPersuasion (h : CorruptlyPersuades d v c)
  | attempt (h : AttemptsIntimidationThreatOrPersuasion d v c)
  | misleadingConduct (h : EngagesInMisleadingConduct d v c)




structure Section1512b (d : Person) (v : Person) (pr : OfficialProceeding) (o : Person)
    (c : ComplaintText) : Prop where
  knowingly : ActedWithScienter d c
  conduct : TamperingConduct1512b d v c
  intent : TamperingIntent1512 d pr o c





inductive ObjectTampering1512c1 (d : Person) (r : RecordOrObject) (c : ComplaintText) : Prop where
  | completed (h : AltersDestroysMutilatesOrConcealsObject d r c)
  | attempted (h : AttemptsToAlterOrConcealObject d r c)



structure DocumentImpairment1512c1 (d : Person) (r : RecordOrObject)
    (pr : OfficialProceeding) (c : ComplaintText) : Prop where
  conduct : ObjectTampering1512c1 d r c
  intent : IntentToImpairObjectForProceeding d r pr c
  proceeding : IsOfficialProceeding pr c



inductive ObstructionConduct1512c2 (d : Person) (pr : OfficialProceeding)
    (c : ComplaintText) : Prop where
  | completed (h : ObstructsInfluencesOrImpedesProceeding d pr c)
  | attempted (h : AttemptsToObstructProceeding d pr c)


structure ProceedingObstruction1512c2 (d : Person) (pr : OfficialProceeding)
    (c : ComplaintText) : Prop where
  conduct : ObstructionConduct1512c2 d pr c
  proceeding : IsOfficialProceeding pr c


inductive Section1512c (d : Person) (r : RecordOrObject) (pr : OfficialProceeding)
    (c : ComplaintText) : Prop where
  | objectImpairment (hCorrupt : ActsCorruptly d c) (h : DocumentImpairment1512c1 d r pr c)
  | otherObstruction (hCorrupt : ActsCorruptly d c) (h : ProceedingObstruction1512c2 d pr c)





inductive HarassmentEffect1512d (v : Person) (pr : OfficialProceeding) (o : Person)
    (c : ComplaintText) : Prop where
  | attendanceOrTestimony (hp : IsOfficialProceeding pr c)
      (h : DissuadedFromAttendingOrTestifying v pr c)
  | reporting (ho : IsFederalLawEnforcementOfficerOrJudge o c)
      (h : DissuadedFromReportingToFederalOfficer v o c)
  | arrest (h : DissuadedFromSeekingArrest v c)
  | prosecutionOrRevocation (h : DissuadedFromCausingProsecutionOrRevocation v c)



structure HarassmentCompleted1512d (d : Person) (v : Person) (pr : OfficialProceeding)
    (o : Person) (c : ComplaintText) : Prop where
  harassment : IntentionallyHarasses d v c
  causation : ProximateCause d c
  effect : HarassmentEffect1512d v pr o c


inductive Section1512d (d : Person) (v : Person) (pr : OfficialProceeding) (o : Person)
    (c : ComplaintText) : Prop where
  | completed (h : HarassmentCompleted1512d d v pr o c)
  | attempted (h : IntentionallyHarasses d v c) (ha : AttemptsToHarassAndDissuade d v c)





structure Section1512k (d : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  agreement : AgreementAmongTwoOrMore ag c
  unlawfulObject : ObjectOfAgreementIsSection1512Offense ag c
  joined : KnowinglyJoinedAgreement d ag c




inductive Section1512Offense (d : Person) (v : Person) (r : RecordOrObject)
    (pr : OfficialProceeding) (o : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  | killing (h : Section1512a1 d v pr o c)
  | force (h : Section1512a2 d v pr o c)
  | tampering (h : Section1512b d v pr o c)
  | obstruction (h : Section1512c d r pr c)
  | harassment (h : Section1512d d v pr o c)
  | conspiracy (h : Section1512k d ag c)


inductive Venue1512i (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop where
  | districtOfIntendedEffect (h : ProsecutedWhereProceedingIntendedToBeAffected pr c)
  | districtOfConduct (h : ProsecutedWhereConductOccurred d c)


abbrev VenueProper (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop :=
  Venue1512i d pr c







structure ValidSection1512Prosecution (d : Person) (v : Person) (r : RecordOrObject)
    (pr : OfficialProceeding) (o : Person) (ag : Agreement) (c : ComplaintText) : Prop where
  offense : Section1512Offense d v r pr o ag c
  venue : VenueProper d pr c
  noTruthfulTestimonyDefense : ¬ LawfulConductSolelyToEncourageTruthfulTestimony d c
  noLegalRepresentationCarveOut : ¬ LawfulBonaFideLegalRepresentation d c

end Proving.USC.T18.Ch73.Reslice.Elements
