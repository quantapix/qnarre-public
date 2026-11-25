import Proving.USC.Common.Types

set_option autoImplicit false
















namespace Proving.USC.T18.Ch96.Deontic

open Proving.USC.Common




inductive Modality
  | Obligation
  | Prohibition
  | Permission
  | Power
  | Definition
  deriving DecidableEq, Repr






inductive NormId

  | s1962a | s1962b | s1962c | s1962d

  | s1963aForfeit | s1963cTransfereeForfeit | s1963dPreserve | s1963d2Tro
  | s1963eJudgment | s1963fDispose | s1963gAuthorized | s1963hRegulations
  | s1963iNoIntervene | s1963jJurisdiction | s1963kDeposition
  | s1963l1Publish | s1963l2Petition | s1963mSubstitute

  | s1964aJurisdiction | s1964bAgInstitute | s1964cPrivateSuit
  | s1964cSecuritiesBar | s1964dEstoppel

  | s1965aVenue | s1965bSummon | s1965cSubpoena | s1965cSubpoenaBar | s1965dProcess

  | s1966AgCertify | s1966ClerkFurnish | s1966JudgeDesignate

  | s1967CourtDiscretion

  | s1968aAgIssue | s1968bDemandContent | s1968cDemandBar | s1968dService
  | s1968f1DesignateCustodian | s1968f2Produce | s1968f3Confidentiality
  | s1968f3CustodianResp | s1968f4AttorneyReturn | s1968f5CustodianReturn
  | s1968f6EntitlementReturn | s1968f7SuccessorCustodian
  | s1968gEnforcePetition | s1968hModifyPetition | s1968iPerformancePetition
  | s1968jJurisdiction
  deriving DecidableEq, Repr



def NormId.modality : NormId → Modality
  | .s1962a => .Prohibition | .s1962b => .Prohibition
  | .s1962c => .Prohibition | .s1962d => .Prohibition
  | .s1963aForfeit => .Obligation | .s1963cTransfereeForfeit => .Obligation
  | .s1963dPreserve => .Power | .s1963d2Tro => .Power
  | .s1963eJudgment => .Obligation | .s1963fDispose => .Obligation
  | .s1963gAuthorized => .Power | .s1963hRegulations => .Power
  | .s1963iNoIntervene => .Prohibition | .s1963jJurisdiction => .Power
  | .s1963kDeposition => .Power | .s1963l1Publish => .Obligation
  | .s1963l2Petition => .Permission | .s1963mSubstitute => .Obligation
  | .s1964aJurisdiction => .Power | .s1964bAgInstitute => .Permission
  | .s1964cPrivateSuit => .Permission | .s1964cSecuritiesBar => .Prohibition
  | .s1964dEstoppel => .Prohibition
  | .s1965aVenue => .Permission | .s1965bSummon => .Power
  | .s1965cSubpoena => .Permission | .s1965cSubpoenaBar => .Prohibition
  | .s1965dProcess => .Permission
  | .s1966AgCertify => .Permission | .s1966ClerkFurnish => .Obligation
  | .s1966JudgeDesignate => .Obligation
  | .s1967CourtDiscretion => .Power
  | .s1968aAgIssue => .Power | .s1968bDemandContent => .Obligation
  | .s1968cDemandBar => .Prohibition | .s1968dService => .Permission
  | .s1968f1DesignateCustodian => .Obligation | .s1968f2Produce => .Obligation
  | .s1968f3Confidentiality => .Prohibition | .s1968f3CustodianResp => .Obligation
  | .s1968f4AttorneyReturn => .Obligation | .s1968f5CustodianReturn => .Obligation
  | .s1968f6EntitlementReturn => .Permission | .s1968f7SuccessorCustodian => .Obligation
  | .s1968gEnforcePetition => .Power | .s1968hModifyPetition => .Permission
  | .s1968iPerformancePetition => .Permission | .s1968jJurisdiction => .Power






def NormId.deadlineDays : NormId → Option Nat
  | .s1963d2Tro => some 14
  | .s1963l2Petition => some 30
  | .s1968hModifyPetition => some 20
  | _ => none

end Proving.USC.T18.Ch96.Deontic
