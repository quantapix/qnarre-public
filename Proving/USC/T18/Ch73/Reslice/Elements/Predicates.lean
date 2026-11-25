












import Proving.USC.T18.Ch73.Reslice.Elements.Types
import Proving.USC.Common.Types
import Proving.USC.Common.Predicates

set_option autoImplicit false

open Proving.USC.Common (Person ComplaintText Entity Agreement)

namespace Proving.USC.T18.Ch73.Reslice.Elements







axiom IsFederalJudicialOrGrandJuryProceeding (pr : OfficialProceeding) (c : ComplaintText) : Prop



axiom IsCongressionalProceeding (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom IsAuthorizedFederalAgencyProceeding (pr : OfficialProceeding) (c : ComplaintText) : Prop






axiom IsInsuranceRegulatoryProceeding (pr : OfficialProceeding) (c : ComplaintText) : Prop







axiom IsFederalLawEnforcementOfficerOrJudge (o : Person) (c : ComplaintText) : Prop





axiom KillsAnotherPerson (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom AttemptsToKillAnotherPerson (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom IntentToPreventAttendanceOrTestimony (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom IntentToPreventProductionOfRecord (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop






axiom IntentToPreventCommunicationToFederalOfficer (d : Person) (o : Person) (c : ComplaintText) : Prop







axiom UsesPhysicalForce (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom ThreatensPhysicalForce (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom AttemptsPhysicalForceOrThreat (d : Person) (v : Person) (c : ComplaintText) : Prop







axiom IntentToInfluenceDelayOrPreventTestimony (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop





axiom IntentToCauseWithholdingOfTestimonyOrObject (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop





axiom IntentToCauseObjectImpairment (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop





axiom IntentToCauseEvasionOfLegalProcess (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop





axiom IntentToCauseAbsenceFromProceeding (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop







axiom IntentToHinderCommunicationToFederalOfficer (d : Person) (o : Person) (c : ComplaintText) : Prop





axiom UsesIntimidation (d : Person) (v : Person) (c : ComplaintText) : Prop



axiom ThreatensAnotherPerson (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom CorruptlyPersuades (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom AttemptsIntimidationThreatOrPersuasion (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom KnowinglyMakesFalseStatement (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom IntentionallyOmitsOrConcealsMaterialFact (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom InvitesRelianceOnFalseWriting (d : Person) (v : Person) (c : ComplaintText) : Prop





axiom InvitesRelianceOnMisleadingObject (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom KnowinglyUsesTrickSchemeOrDevice (d : Person) (v : Person) (c : ComplaintText) : Prop







axiom ActsCorruptly (d : Person) (c : ComplaintText) : Prop




axiom AltersDestroysMutilatesOrConcealsObject (d : Person) (r : RecordOrObject) (c : ComplaintText) : Prop




axiom AttemptsToAlterOrConcealObject (d : Person) (r : RecordOrObject) (c : ComplaintText) : Prop




axiom IntentToImpairObjectForProceeding (d : Person) (r : RecordOrObject) (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom ObstructsInfluencesOrImpedesProceeding (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom AttemptsToObstructProceeding (d : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop





axiom IntentionallyHarasses (d : Person) (v : Person) (c : ComplaintText) : Prop




axiom DissuadedFromAttendingOrTestifying (v : Person) (pr : OfficialProceeding) (c : ComplaintText) : Prop







axiom DissuadedFromReportingToFederalOfficer (v : Person) (o : Person) (c : ComplaintText) : Prop





axiom DissuadedFromSeekingArrest (v : Person) (c : ComplaintText) : Prop





axiom DissuadedFromCausingProsecutionOrRevocation (v : Person) (c : ComplaintText) : Prop




axiom AttemptsToHarassAndDissuade (d : Person) (v : Person) (c : ComplaintText) : Prop









axiom LawfulConductSolelyToEncourageTruthfulTestimony (d : Person) (c : ComplaintText) : Prop





axiom LawfulBonaFideLegalRepresentation (d : Person) (c : ComplaintText) : Prop






axiom ProsecutedWhereProceedingIntendedToBeAffected (pr : OfficialProceeding) (c : ComplaintText) : Prop




axiom ProsecutedWhereConductOccurred (d : Person) (c : ComplaintText) : Prop






axiom ObjectOfAgreementIsSection1512Offense (ag : Agreement) (c : ComplaintText) : Prop




axiom KnowinglyJoinedAgreement (d : Person) (ag : Agreement) (c : ComplaintText) : Prop

end Proving.USC.T18.Ch73.Reslice.Elements
