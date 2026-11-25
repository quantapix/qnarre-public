































import Proving.USC.T42.Ch21CivilRights.Recert.Elements.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Deontic.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Ontology.Statute
import Proving.USC.T42.Ch21CivilRights.Recert.Procedure.Statute

set_option autoImplicit false

namespace Proving.USC.T42.Ch21CivilRights.Recert.Bridge

open Proving.USC.Common
open Proving.USC.T42.Ch21CivilRights.Recert














namespace S2000d4a

axiom mapPA : Elements.Program → Ontology.ProgramOrActivity
axiom mapEnt : Elements.Recipient → Entity
axiom mapFFA : Elements.Program → Ontology.FederalFinancialAssistance



axiom corr_anyPart {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.AnyPartExtendedFederalFinancialAssistance pr c →
    Elements.OperatesProgramOrActivity r pr c →
    Ontology.AnyPartExtendedFederalFinancialAssistance (mapEnt r) (mapFFA pr) c

axiom corr_route_stateLocalInstrumentality
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.IsStateOrLocalInstrumentality pr c →
    Ontology.IsStateOrLocalInstrumentality (mapEnt r) c

axiom corr_route_distributingEntity
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.IsStateOrLocalDistributingEntity pr c →
    Ontology.IsAssistanceDistributingGovernmentEntity (mapEnt r) c

axiom corr_route_distributingAssistance
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.IsStateOrLocalDistributingEntity pr c →
    Ontology.IsAssistanceToStateOrLocalGovernment (mapFFA pr) c

axiom corr_route_postsecondary
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.IsPostsecondaryInstitution pr c →
    Ontology.IsPostsecondaryInstitution (mapEnt r) c





axiom corr_route_schoolSystem
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.IsSchoolSystemOrLocalEducationalAgency pr c →
    Ontology.IsOtherSchoolSystem (mapEnt r) c

axiom corr_route_entirePrivate
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.IsEntirePrivateOrganization pr c →
    Ontology.IsEntirePrivateOrganization (mapEnt r) c

axiom corr_route_asWhole
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.AssistanceExtendedToOrganizationAsWhole pr c →
    Ontology.AssistanceExtendedToOrganizationAsWhole (mapEnt r) (mapFFA pr) c

axiom corr_route_principallyEngaged
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.PrincipallyEngagedInCoveredServices pr c →
    Ontology.IsPrincipallyEngagedInCoveredBusiness (mapEnt r) c

axiom corr_route_separateFacility
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.IsGeographicallySeparateFundedFacility pr c →
    Ontology.IsGeographicallySeparateFacility (mapEnt r) (mapFFA pr) c

axiom corr_route_jointlyEstablished
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText} :
    Elements.EstablishedByTwoOrMoreCoveredEntities pr c →
    Ontology.IsEntityEstablishedByTwoOrMoreCoveredEntities (mapEnt r) c





theorem categoryRoutesAgree {pr : Elements.Program} {r : Elements.Recipient}
    {c : ComplaintText} (h : Elements.ProgramOrActivityCategory pr c) :
    Ontology.ProgramOrActivityEntityCase (mapEnt r) (mapFFA pr) c :=
  match h with
  | .stateOrLocalInstrumentality hx =>
      .stateOrLocalInstrumentality (corr_route_stateLocalInstrumentality (r := r) hx)
  | .stateOrLocalDistributingEntity hx =>
      .assistanceDistributingEntity (corr_route_distributingEntity (r := r) hx)
        (corr_route_distributingAssistance (r := r) hx)
  | .postsecondary hx => .postsecondaryInstitution (corr_route_postsecondary (r := r) hx)
  | .schoolSystem hx => .otherSchoolSystem (corr_route_schoolSystem (r := r) hx)
  | .entirePrivateOrganization hx =>
      match hx.route with
      | .asWhole hw =>
          .entirePrivateOrganizationAssistedAsWhole
            (corr_route_entirePrivate (r := r) hx.entire) (corr_route_asWhole (r := r) hw)
      | .principallyEngaged hp =>
          .entirePrivateOrganizationPrincipallyEngaged
            (corr_route_entirePrivate (r := r) hx.entire)
            (corr_route_principallyEngaged (r := r) hp)
  | .separateFacility hx => .geographicallySeparateFacility (corr_route_separateFacility (r := r) hx)
  | .establishedByCoveredEntities hx =>
      .jointlyEstablishedEntity (corr_route_jointlyEstablished (r := r) hx)








theorem s2000d4a_elements_implies_ontology_modulo_gaps
    {pr : Elements.Program} {r : Elements.Recipient} {c : ComplaintText}
    (h : Elements.ProgramOrActivity2000d4a pr c)
    (hop : Elements.OperatesProgramOrActivity r pr c)
    (gap_allOperations : Ontology.ConsistsOfAllOperationsOf (mapPA pr) (mapEnt r) c) :
    Ontology.ProgramOrActivityMembership (mapPA pr) (mapEnt r) (mapFFA pr) c :=
  ⟨gap_allOperations, categoryRoutesAgree (r := r) h.category,
   corr_anyPart h.anyPartFunded hop⟩

axiom mapDeonticRecipient : Elements.Program → Deontic.Recipient






axiom corr_termApplies {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProgramOrActivity2000d4a pr c →
    Deontic.TermProgramOrActivityApplies (mapDeonticRecipient pr) c



theorem s2000d4a_elements_implies_deontic
    {pr : Elements.Program} {c : ComplaintText}
    (h : Elements.ProgramOrActivity2000d4a pr c) :
    Deontic.DefinedProgramOrActivity (mapDeonticRecipient pr) c :=
  corr_termApplies h

end S2000d4a








namespace S2000d



axiom mapED : Elements.Program → Deontic.Recipient

axiom corrED_addressee {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText} :
    Elements.OperatesProgramOrActivity r pr c →
    Elements.ReceivesFederalFinancialAssistance pr c →
    Deontic.AddresseeIsFederallyAssistedProgram (mapED pr) c

axiom corrED_term {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProgramOrActivity2000d4a pr c →
    Deontic.TermProgramOrActivityApplies (mapED pr) c

axiom corrED_assistance {pr : Elements.Program} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance pr c →
    Deontic.ReceivesFederalFinancialAssistance (mapED pr) c

axiom corrED_person {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Deontic.IsPersonInUnitedStates p c



axiom corrED_act {p : Person} {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProhibitedTreatment p pr c →
    Deontic.ActExcludedDeniedBenefitsOrDiscriminated (mapED pr) p c



axiom corrED_ground {p : Person} {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProhibitedGround p c →
    Elements.TreatmentOnGroundOfProtectedTrait p pr c →
    Deontic.OnGroundOfRaceColorOrNationalOrigin p (mapED pr) c



theorem s2000d_elements_implies_deontic
    {p : Person} {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText}
    (h : Elements.Section2000d p r pr c) :
    Deontic.Prohibition2000dViolated (mapED pr) p c :=
  ⟨⟨corrED_addressee h.operatesProgram h.federallyAssisted,
    corrED_term h.programOrActivity,
    corrED_assistance h.federallyAssisted,
    corrED_person h.personInUS⟩,
   corrED_act h.treatment,
   corrED_ground h.ground h.onThatGround⟩



axiom groundEO : Person → ComplaintText → Ontology.Ground
axiom treatmentEO : Person → Elements.Program → ComplaintText → Ontology.Treatment

axiom corrEO_person {p : Person} {c : ComplaintText} :
    IsPersonInUS p c → Ontology.IsPersonInUS p c

axiom corrEO_ground {p : Person} {c : ComplaintText} :
    Elements.ProhibitedGround p c → Ontology.IsProtectedGround (groundEO p c) c

axiom corrEO_treatment {p : Person} {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProhibitedTreatment p pr c →
    Ontology.IsProhibitedTreatment (treatmentEO p pr c) c

axiom corrEO_isFFA {pr : Elements.Program} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance pr c →
    Ontology.IsFederalFinancialAssistance (S2000d4a.mapFFA pr) c

axiom corrEO_receives {pr : Elements.Program} {c : ComplaintText} :
    Elements.ReceivesFederalFinancialAssistance pr c →
    Ontology.ReceivesFederalFinancialAssistance (S2000d4a.mapPA pr) (S2000d4a.mapFFA pr) c









theorem s2000d_elements_implies_ontology_modulo_gaps
    {p : Person} {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText}
    (h : Elements.Section2000d p r pr c)
    (gap_allOperations :
      Ontology.ConsistsOfAllOperationsOf (S2000d4a.mapPA pr) (S2000d4a.mapEnt r) c) :
    Ontology.Section2000dCoveredInjury p (groundEO p c) (treatmentEO p pr c)
      (S2000d4a.mapPA pr) (S2000d4a.mapEnt r) (S2000d4a.mapFFA pr) c :=
  ⟨corrEO_person h.personInUS,
   corrEO_ground h.ground,
   corrEO_treatment h.treatment,
   ⟨S2000d4a.s2000d4a_elements_implies_ontology_modulo_gaps
      h.programOrActivity h.operatesProgram gap_allOperations,
    corrEO_isFFA h.federallyAssisted,
    corrEO_receives h.federallyAssisted⟩⟩



axiom mapEPRecipient : Elements.Recipient → Procedure.Recipient
axiom mapEPProgram : Elements.Program → Procedure.ProgramOrActivity

axiom corrEP_receives {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText} :
    Elements.OperatesProgramOrActivity r pr c →
    Elements.ReceivesFederalFinancialAssistance pr c →
    Procedure.ReceivesFederalFinancialAssistance (mapEPRecipient r) c

axiom corrEP_covered {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText} :
    Elements.ProgramOrActivity2000d4a pr c →
    Elements.OperatesProgramOrActivity r pr c →
    Procedure.IsCoveredProgramOrActivity (mapEPProgram pr) (mapEPRecipient r) c





theorem s2000d_elements_implies_procedure
    {p : Person} {r : Elements.Recipient} {pr : Elements.Program} {c : ComplaintText}
    (h : Elements.Section2000d p r pr c) :
    Procedure.CoveredFederalAssistanceNexus (mapEPRecipient r) (mapEPProgram pr) c :=
  ⟨corrEP_receives h.operatesProgram h.federallyAssisted,
   corrEP_covered h.programOrActivity h.operatesProgram⟩



axiom mapDOProgram : Deontic.Recipient → Ontology.ProgramOrActivity
axiom mapDOEntity : Deontic.Recipient → Entity
axiom mapDOAssistance : Deontic.Recipient → Ontology.FederalFinancialAssistance
axiom groundDO : Person → Deontic.Recipient → ComplaintText → Ontology.Ground
axiom treatmentDO : Person → Deontic.Recipient → ComplaintText → Ontology.Treatment

axiom corrDO_person {p : Person} {c : ComplaintText} :
    Deontic.IsPersonInUnitedStates p c → Ontology.IsPersonInUS p c

axiom corrDO_ground {p : Person} {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.OnGroundOfRaceColorOrNationalOrigin p r c →
    Ontology.IsProtectedGround (groundDO p r c) c

axiom corrDO_treatment {p : Person} {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.ActExcludedDeniedBenefitsOrDiscriminated r p c →
    Ontology.IsProhibitedTreatment (treatmentDO p r c) c






axiom corrDO_entityCase {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.TermProgramOrActivityApplies r c →
    Ontology.ProgramOrActivityEntityCase (mapDOEntity r) (mapDOAssistance r) c

axiom corrDO_anyPart {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.TermProgramOrActivityApplies r c →
    Ontology.AnyPartExtendedFederalFinancialAssistance (mapDOEntity r) (mapDOAssistance r) c

axiom corrDO_isFFA {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.ReceivesFederalFinancialAssistance r c →
    Ontology.IsFederalFinancialAssistance (mapDOAssistance r) c

axiom corrDO_receives {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.ReceivesFederalFinancialAssistance r c →
    Ontology.ReceivesFederalFinancialAssistance (mapDOProgram r) (mapDOAssistance r) c



theorem s2000d_deontic_implies_ontology_modulo_gaps
    {r : Deontic.Recipient} {p : Person} {c : ComplaintText}
    (h : Deontic.Prohibition2000dViolated r p c)
    (gap_allOperations : Ontology.ConsistsOfAllOperationsOf (mapDOProgram r) (mapDOEntity r) c) :
    Ontology.Section2000dCoveredInjury p (groundDO p r c) (treatmentDO p r c)
      (mapDOProgram r) (mapDOEntity r) (mapDOAssistance r) c :=
  ⟨corrDO_person h.1.personInUS,
   corrDO_ground h.2.2,
   corrDO_treatment h.2.1,
   ⟨⟨gap_allOperations, corrDO_entityCase h.1.programOrActivity,
     corrDO_anyPart h.1.programOrActivity⟩,
    corrDO_isFFA h.1.assistance,
    corrDO_receives h.1.assistance⟩⟩



axiom mapDPRecipient : Deontic.Recipient → Procedure.Recipient
axiom mapDPProgram : Deontic.Recipient → Procedure.ProgramOrActivity

axiom corrDP_receives {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.ReceivesFederalFinancialAssistance r c →
    Procedure.ReceivesFederalFinancialAssistance (mapDPRecipient r) c

axiom corrDP_covered {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.TermProgramOrActivityApplies r c →
    Deontic.AddresseeIsFederallyAssistedProgram r c →
    Procedure.IsCoveredProgramOrActivity (mapDPProgram r) (mapDPRecipient r) c


theorem s2000d_deontic_implies_procedure
    {r : Deontic.Recipient} {p : Person} {c : ComplaintText}
    (h : Deontic.Prohibition2000dViolated r p c) :
    Procedure.CoveredFederalAssistanceNexus (mapDPRecipient r) (mapDPProgram r) c :=
  ⟨corrDP_receives h.1.assistance,
   corrDP_covered h.1.programOrActivity h.1.addressee⟩



axiom mapOPRecipient : Entity → Procedure.Recipient
axiom mapOPProgram : Ontology.ProgramOrActivity → Procedure.ProgramOrActivity

axiom corrOP_receives {pa : Ontology.ProgramOrActivity} {e : Entity}
    {f : Ontology.FederalFinancialAssistance} {c : ComplaintText} :
    Ontology.ReceivesFederalFinancialAssistance pa f c →
    Ontology.ProgramOrActivityMembership pa e f c →
    Procedure.ReceivesFederalFinancialAssistance (mapOPRecipient e) c

axiom corrOP_covered {pa : Ontology.ProgramOrActivity} {e : Entity}
    {f : Ontology.FederalFinancialAssistance} {c : ComplaintText} :
    Ontology.ProgramOrActivityMembership pa e f c →
    Procedure.IsCoveredProgramOrActivity (mapOPProgram pa) (mapOPRecipient e) c


theorem s2000d_ontology_implies_procedure
    {p : Person} {g : Ontology.Ground} {t : Ontology.Treatment}
    {pa : Ontology.ProgramOrActivity} {e : Entity}
    {f : Ontology.FederalFinancialAssistance} {c : ComplaintText}
    (h : Ontology.Section2000dCoveredInjury p g t pa e f c) :
    Procedure.CoveredFederalAssistanceNexus (mapOPRecipient e) (mapOPProgram pa) c :=
  ⟨corrOP_receives h.program.receives h.program.program,
   corrOP_covered h.program.program⟩

end S2000d






namespace S2000a4



axiom mapEDAddressee : Elements.Investigation → Deontic.Addressee

axiom corrED_service {i : Elements.Investigation} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt i c →
    Deontic.AddresseeIsCommunityRelationsService (mapEDAddressee i) c

axiom corrED_referral {i : Elements.Investigation} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt i c →
    Deontic.CondComplaintReferredByCourtUnder2000a3d c







theorem s2000a4_elements_implies_deontic_modulo_gaps
    {i : Elements.Investigation} {hg : Elements.Hearing} {c : ComplaintText}
    (h : Elements.Section2000a4Compliance i hg c)
    (gap_fullInvestigation :
      Deontic.ActFullInvestigationOfReferredComplaint (mapEDAddressee i) c) :
    Deontic.Power2000a4InvestigateExercised (mapEDAddressee i) c :=
  ⟨⟨corrED_service h.authority.referred, corrED_referral h.authority.referred⟩,
   gap_fullInvestigation⟩



axiom mapEOEntity : Elements.Investigation → Entity
axiom mapEOInv : Elements.Investigation → Ontology.Investigation
axiom mapEORC : Elements.Investigation → Ontology.ReferredComplaint

axiom corrEO_service {i : Elements.Investigation} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt i c →
    Ontology.IsCommunityRelationsService (mapEOEntity i) c

axiom corrEO_referred {i : Elements.Investigation} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt i c →
    Ontology.IsCourtReferredComplaint (mapEORC i) c


theorem s2000a4_elements_implies_ontology_modulo_gaps
    {i : Elements.Investigation} {hg : Elements.Hearing} {c : ComplaintText}
    (h : Elements.Section2000a4Compliance i hg c)
    (gap_fullInvestigation : Ontology.IsFullInvestigation (mapEOInv i) (mapEORC i) c) :
    Ontology.ServiceInvestigation (mapEOEntity i) (mapEOInv i) (mapEORC i) c :=
  ⟨corrEO_service h.authority.referred, corrEO_referred h.authority.referred,
   gap_fullInvestigation⟩



axiom mapEPRef : Elements.Investigation → Procedure.ServiceReferral

axiom corrEP_referred {i : Elements.Investigation} {c : ComplaintText} :
    Elements.ComplaintReferredByCourt i c →
    Procedure.ComplaintReferredByCourtToService (mapEPRef i) c

axiom corrEP_settlement {i : Elements.Investigation} {c : ComplaintText} :
    Elements.EndeavoredToBringVoluntarySettlement i c →
    Procedure.VoluntarySettlementEndeavored (mapEPRef i) c

axiom corrEP_releasePermitted {i : Elements.Investigation} {t : Elements.Testimony}
    {c : ComplaintText} :
    Elements.Section2000a4LawfulTestimonyRelease t c →
    Procedure.TestimonyReleasePermitted (mapEPRef i) c





theorem s2000a4_elements_implies_procedure_modulo_gaps
    {i : Elements.Investigation} {hg : Elements.Hearing} {t : Elements.Testimony}
    {c : ComplaintText}
    (h : Elements.Section2000a4Compliance i hg c)
    (hrel : Elements.Section2000a4LawfulTestimonyRelease t c)
    (gap_fullInvestigation : Procedure.FullInvestigationMade (mapEPRef i) c) :
    Procedure.Section2000a4ServiceProcess (mapEPRef i) c :=
  ⟨corrEP_referred h.authority.referred, gap_fullInvestigation,
   Or.inr (corrEP_releasePermitted (i := i) hrel),
   corrEP_settlement h.endeavoredSettlement⟩



axiom mapDOEntity : Deontic.Addressee → Entity
axiom mapDOInv : Deontic.Addressee → Ontology.Investigation
axiom mapDORC : Deontic.Addressee → Ontology.ReferredComplaint

axiom corrDO_service {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.AddresseeIsCommunityRelationsService a c →
    Ontology.IsCommunityRelationsService (mapDOEntity a) c

axiom corrDO_referred {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.CondComplaintReferredByCourtUnder2000a3d c →
    Ontology.IsCourtReferredComplaint (mapDORC a) c

axiom corrDO_investigation {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.ActFullInvestigationOfReferredComplaint a c →
    Ontology.IsFullInvestigation (mapDOInv a) (mapDORC a) c


theorem s2000a4_deontic_implies_ontology
    {a : Deontic.Addressee} {c : ComplaintText}
    (h : Deontic.Power2000a4InvestigateExercised a c) :
    Ontology.ServiceInvestigation (mapDOEntity a) (mapDOInv a) (mapDORC a) c :=
  ⟨corrDO_service h.1.addressee, corrDO_referred (a := a) h.1.referral,
   corrDO_investigation h.2⟩



axiom mapDPRef : Deontic.Addressee → Procedure.ServiceReferral

axiom corrDP_referred {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.CondComplaintReferredByCourtUnder2000a3d c →
    Procedure.ComplaintReferredByCourtToService (mapDPRef a) c

axiom corrDP_investigated {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.ActFullInvestigationOfReferredComplaint a c →
    Procedure.FullInvestigationMade (mapDPRef a) c



axiom corrDP_escape {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.EscapeAllPartiesAgreedWithCourtPermission c →
    Procedure.TestimonyReleasePermitted (mapDPRef a) c

axiom corrDP_settlement {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.ActEndeavoredToBringAboutVoluntarySettlement a c →
    Procedure.VoluntarySettlementEndeavored (mapDPRef a) c


theorem s2000a4_deontic_implies_procedure
    {a : Deontic.Addressee} {c : ComplaintText}
    (h : Deontic.Power2000a4InvestigateExercised a c)
    (hesc : Deontic.EscapeAllPartiesAgreedWithCourtPermission c)
    (hset : Deontic.ActEndeavoredToBringAboutVoluntarySettlement a c) :
    Procedure.Section2000a4ServiceProcess (mapDPRef a) c :=
  ⟨corrDP_referred (a := a) h.1.referral, corrDP_investigated h.2,
   Or.inr (corrDP_escape (a := a) hesc), corrDP_settlement hset⟩



axiom mapOPRef : Ontology.ReferredComplaint → Procedure.ServiceReferral

axiom corrOP_referred {rc : Ontology.ReferredComplaint} {c : ComplaintText} :
    Ontology.IsCourtReferredComplaint rc c →
    Procedure.ComplaintReferredByCourtToService (mapOPRef rc) c

axiom corrOP_investigated {inv : Ontology.Investigation} {rc : Ontology.ReferredComplaint}
    {c : ComplaintText} :
    Ontology.IsFullInvestigation inv rc c → Procedure.FullInvestigationMade (mapOPRef rc) c

axiom corrOP_releasePermitted {t : Ontology.Testimony} {hg : Ontology.Hearing}
    {rc : Ontology.ReferredComplaint} {c : ComplaintText} :
    Ontology.PermittedTestimonyRelease t hg rc c →
    Procedure.TestimonyReleasePermitted (mapOPRef rc) c

axiom corrOP_settlement {e : Entity} {s : Ontology.Settlement}
    {rc : Ontology.ReferredComplaint} {c : ComplaintText} :
    Ontology.VoluntarySettlementEndeavor e s rc c →
    Procedure.VoluntarySettlementEndeavored (mapOPRef rc) c


theorem s2000a4_ontology_implies_procedure
    {e : Entity} {inv : Ontology.Investigation} {rc : Ontology.ReferredComplaint}
    {t : Ontology.Testimony} {hg : Ontology.Hearing} {s : Ontology.Settlement}
    {c : ComplaintText}
    (h : Ontology.ServiceInvestigation e inv rc c)
    (hrel : Ontology.PermittedTestimonyRelease t hg rc c)
    (hset : Ontology.VoluntarySettlementEndeavor e s rc c) :
    Procedure.Section2000a4ServiceProcess (mapOPRef rc) c :=
  ⟨corrOP_referred h.referred, corrOP_investigated h.investigation,
   Or.inr (corrOP_releasePermitted hrel), corrOP_settlement hset⟩

end S2000a4






namespace S2000a5



axiom mapEDAddressee : Elements.Pleading → Deontic.Addressee
axiom mapEDProceeding : Elements.Pleading → Deontic.Proceeding

axiom corrED_addressee {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral pl c →
    Deontic.AddresseeIsAttorneyGeneral (mapEDAddressee pl) c

axiom corrED_cause {pl : Elements.Pleading} {pp : Elements.PatternOrPractice}
    {c : ComplaintText} :
    Elements.AttorneyGeneralHasReasonableCause pp c →
    Deontic.CondAttorneyGeneralHasReasonableCause (mapEDAddressee pl) c

axiom corrED_pattern {d : Person} {pp : Elements.PatternOrPractice} {c : ComplaintText} :
    Elements.EngagedInPatternOrPracticeOfResistance d pp c →
    Elements.ResistanceToRightsSecuredBySubchapter pp c →
    Deontic.CondPatternOrPracticeOfResistance c

axiom corrED_intent {pp : Elements.PatternOrPractice} {c : ComplaintText} :
    Elements.PatternIntendedToDenyFullExercise pp c →
    Deontic.CondPatternIntendedToDenyFullExercise c

axiom corrED_brought {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt pl c →
    Deontic.ActBroughtPatternOrPracticeCivilAction (mapEDAddressee pl) (mapEDProceeding pl) c




axiom corrED_pleading {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral pl c →
    Elements.ComplaintSetsForthPatternFacts pl c →
    Elements.ComplaintRequestsPreventiveRelief pl c →
    Deontic.CondComplaintSignedSetsForthFactsAndRequestsRelief (mapEDProceeding pl) c


theorem s2000a5_elements_implies_deontic
    {d : Person} {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText} (h : Elements.Section2000a5Action d pp pl c) :
    Deontic.Power2000a5PatternOrPracticeActionExercised
      (mapEDAddressee pl) (mapEDProceeding pl) c :=
  ⟨⟨corrED_addressee h.signed, corrED_cause (pl := pl) h.reasonableCause,
    corrED_pattern h.patternOrPractice h.resistanceToSecuredRights,
    corrED_intent h.intendedToDeny⟩,
   corrED_brought h.appropriateCourt,
   corrED_pleading h.signed h.factsSetForth h.reliefRequested⟩



axiom mapEOComplaint : Elements.Pleading → Ontology.AttorneyGeneralComplaint
axiom mapEOOfficer : Elements.Pleading → Person
axiom mapEOPattern : Elements.PatternOrPractice → Ontology.PatternOrPractice
axiom mapEORelief : Elements.Pleading → Ontology.Relief
axiom mapEOCourt : Elements.Pleading → Ontology.Court

axiom corrEO_forum {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt pl c →
    Ontology.IsAppropriateDistrictCourt (mapEOCourt pl) c

axiom corrEO_cause {pl : Elements.Pleading} {pp : Elements.PatternOrPractice}
    {c : ComplaintText} :
    Elements.AttorneyGeneralHasReasonableCause pp c →
    Ontology.HasReasonableCauseToBelieve (mapEOOfficer pl) (mapEOPattern pp) c

axiom corrEO_isPattern {d : Person} {pp : Elements.PatternOrPractice} {c : ComplaintText} :
    Elements.EngagedInPatternOrPracticeOfResistance d pp c →
    Ontology.IsPatternOrPractice (mapEOPattern pp) c

axiom corrEO_resistance {pp : Elements.PatternOrPractice} {c : ComplaintText} :
    Elements.ResistanceToRightsSecuredBySubchapter pp c →
    Ontology.IsResistanceToSubchapterRights (mapEOPattern pp) c

axiom corrEO_intent {pp : Elements.PatternOrPractice} {c : ComplaintText} :
    Elements.PatternIntendedToDenyFullExercise pp c →
    Ontology.IsIntendedToDenyFullExercise (mapEOPattern pp) c





axiom corrEO_signed {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral pl c →
    Ontology.IsSignedByOfficer (mapEOComplaint pl) (mapEOOfficer pl) c

axiom corrEO_officer {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral pl c →
    Ontology.IsSigningOfficer (mapEOOfficer pl) c

axiom corrEO_facts {pl : Elements.Pleading} {pp : Elements.PatternOrPractice}
    {c : ComplaintText} :
    Elements.ComplaintSetsForthPatternFacts pl c →
    Ontology.SetsForthPatternOrPracticeFacts (mapEOComplaint pl) (mapEOPattern pp) c




axiom corrEO_requests {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintRequestsPreventiveRelief pl c →
    Ontology.RequestsRelief (mapEOComplaint pl) (mapEORelief pl) c

axiom corrEO_reliefKind {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintRequestsPreventiveRelief pl c →
    Ontology.IsPreventiveRelief (mapEORelief pl) c


theorem s2000a5_elements_implies_ontology
    {d : Person} {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText} (h : Elements.Section2000a5Action d pp pl c) :
    Ontology.AttorneyGeneralComplaintMembership (mapEOComplaint pl) (mapEOOfficer pl)
      (mapEOPattern pp) (mapEORelief pl) (mapEOCourt pl) c :=
  ⟨corrEO_forum h.appropriateCourt,
   corrEO_cause (pl := pl) h.reasonableCause,
   ⟨corrEO_isPattern h.patternOrPractice, corrEO_resistance h.resistanceToSecuredRights,
    corrEO_intent h.intendedToDeny⟩,
   corrEO_signed h.signed,
   corrEO_officer h.signed,
   corrEO_facts (pp := pp) h.factsSetForth,
   corrEO_requests h.reliefRequested,
   corrEO_reliefKind h.reliefRequested⟩



axiom mapEPAction : Elements.Pleading → Procedure.AttorneyGeneralAction
axiom mapEPCourt : Elements.Pleading → Procedure.DistrictCourt

axiom corrEP_cause {pl : Elements.Pleading} {pp : Elements.PatternOrPractice}
    {c : ComplaintText} :
    Elements.AttorneyGeneralHasReasonableCause pp c →
    Procedure.AttorneyGeneralHasReasonableCause (mapEPAction pl) c

axiom corrEP_pattern {d : Person} {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText} :
    Elements.EngagedInPatternOrPracticeOfResistance d pp c →
    Elements.ResistanceToRightsSecuredBySubchapter pp c →
    Procedure.PatternOrPracticeOfResistance (mapEPAction pl) c

axiom corrEP_intent {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText} :
    Elements.PatternIntendedToDenyFullExercise pp c →
    Procedure.PatternIntendedToDenyFullExercise (mapEPAction pl) c

axiom corrEP_forum {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.FiledInAppropriateDistrictCourt pl c →
    Procedure.FiledInAppropriateDistrictCourt (mapEPAction pl) (mapEPCourt pl) c

axiom corrEP_signed {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintSignedByAttorneyGeneral pl c →
    Procedure.ComplaintSignedByAttorneyGeneral (mapEPAction pl) c

axiom corrEP_facts {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintSetsForthPatternFacts pl c →
    Procedure.ComplaintSetsForthPatternFacts (mapEPAction pl) c

axiom corrEP_relief {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ComplaintRequestsPreventiveRelief pl c →
    Procedure.ComplaintRequestsPreventiveRelief (mapEPAction pl) c


theorem s2000a5_elements_implies_procedure
    {d : Person} {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText} (h : Elements.Section2000a5Action d pp pl c) :
    Procedure.ProperlyFiledPatternPracticeComplaint (mapEPAction pl) (mapEPCourt pl) c :=
  ⟨⟨corrEP_cause (pl := pl) h.reasonableCause,
    corrEP_pattern (pl := pl) h.patternOrPractice h.resistanceToSecuredRights,
    corrEP_intent (pl := pl) h.intendedToDeny⟩,
   corrEP_forum h.appropriateCourt, corrEP_signed h.signed,
   corrEP_facts h.factsSetForth, corrEP_relief h.reliefRequested⟩



axiom mapODAddressee : Ontology.AttorneyGeneralComplaint → Deontic.Addressee
axiom mapODProceeding : Ontology.AttorneyGeneralComplaint → Deontic.Proceeding

axiom corrOD_addressee {p : Person} {cp : Ontology.AttorneyGeneralComplaint}
    {c : ComplaintText} :
    Ontology.IsSigningOfficer p c → Deontic.AddresseeIsAttorneyGeneral (mapODAddressee cp) c

axiom corrOD_cause {p : Person} {pp : Ontology.PatternOrPractice}
    {cp : Ontology.AttorneyGeneralComplaint} {c : ComplaintText} :
    Ontology.HasReasonableCauseToBelieve p pp c →
    Deontic.CondAttorneyGeneralHasReasonableCause (mapODAddressee cp) c

axiom corrOD_pattern {pp : Ontology.PatternOrPractice} {c : ComplaintText} :
    Ontology.PatternOrPracticeOfResistance pp c →
    Deontic.CondPatternOrPracticeOfResistance c

axiom corrOD_intent {pp : Ontology.PatternOrPractice} {c : ComplaintText} :
    Ontology.IsIntendedToDenyFullExercise pp c →
    Deontic.CondPatternIntendedToDenyFullExercise c

axiom corrOD_brought {ct : Ontology.Court} {cp : Ontology.AttorneyGeneralComplaint}
    {c : ComplaintText} :
    Ontology.IsAppropriateDistrictCourt ct c →
    Deontic.ActBroughtPatternOrPracticeCivilAction (mapODAddressee cp) (mapODProceeding cp) c

axiom corrOD_pleading {cp : Ontology.AttorneyGeneralComplaint} {p : Person}
    {pp : Ontology.PatternOrPractice} {r : Ontology.Relief} {c : ComplaintText} :
    Ontology.IsSignedByOfficer cp p c →
    Ontology.SetsForthPatternOrPracticeFacts cp pp c →
    Ontology.RequestsRelief cp r c →
    Deontic.CondComplaintSignedSetsForthFactsAndRequestsRelief (mapODProceeding cp) c


theorem s2000a5_ontology_implies_deontic
    {cp : Ontology.AttorneyGeneralComplaint} {p : Person} {pp : Ontology.PatternOrPractice}
    {r : Ontology.Relief} {ct : Ontology.Court} {c : ComplaintText}
    (h : Ontology.AttorneyGeneralComplaintMembership cp p pp r ct c) :
    Deontic.Power2000a5PatternOrPracticeActionExercised
      (mapODAddressee cp) (mapODProceeding cp) c :=
  ⟨⟨corrOD_addressee (cp := cp) h.officer, corrOD_cause (cp := cp) h.reasonableCause,
    corrOD_pattern h.resistance, corrOD_intent h.resistance.intent⟩,
   corrOD_brought (cp := cp) h.forum,
   corrOD_pleading h.signed h.facts h.requests⟩



axiom mapPDAddressee : Procedure.AttorneyGeneralAction → Deontic.Addressee
axiom mapPDProceeding : Procedure.AttorneyGeneralAction → Deontic.Proceeding

axiom corrPD_addressee {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.ComplaintSignedByAttorneyGeneral act c →
    Deontic.AddresseeIsAttorneyGeneral (mapPDAddressee act) c

axiom corrPD_cause {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.AttorneyGeneralHasReasonableCause act c →
    Deontic.CondAttorneyGeneralHasReasonableCause (mapPDAddressee act) c

axiom corrPD_pattern {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.PatternOrPracticeOfResistance act c →
    Deontic.CondPatternOrPracticeOfResistance c

axiom corrPD_intent {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.PatternIntendedToDenyFullExercise act c →
    Deontic.CondPatternIntendedToDenyFullExercise c

axiom corrPD_brought {act : Procedure.AttorneyGeneralAction} {d : Procedure.DistrictCourt}
    {c : ComplaintText} :
    Procedure.FiledInAppropriateDistrictCourt act d c →
    Deontic.ActBroughtPatternOrPracticeCivilAction (mapPDAddressee act) (mapPDProceeding act) c

axiom corrPD_pleading {act : Procedure.AttorneyGeneralAction} {c : ComplaintText} :
    Procedure.ComplaintSignedByAttorneyGeneral act c →
    Procedure.ComplaintSetsForthPatternFacts act c →
    Procedure.ComplaintRequestsPreventiveRelief act c →
    Deontic.CondComplaintSignedSetsForthFactsAndRequestsRelief (mapPDProceeding act) c


theorem s2000a5_procedure_implies_deontic
    {act : Procedure.AttorneyGeneralAction} {d : Procedure.DistrictCourt} {c : ComplaintText}
    (h : Procedure.ProperlyFiledPatternPracticeComplaint act d c) :
    Deontic.Power2000a5PatternOrPracticeActionExercised
      (mapPDAddressee act) (mapPDProceeding act) c :=
  ⟨⟨corrPD_addressee h.signed, corrPD_cause h.cause.reasonableCause,
    corrPD_pattern h.cause.patternOrPractice, corrPD_intent h.cause.intentToDeny⟩,
   corrPD_brought h.appropriateCourt,
   corrPD_pleading h.signed h.factsSetForth h.reliefRequested⟩



axiom mapOPAction : Ontology.AttorneyGeneralComplaint → Procedure.AttorneyGeneralAction
axiom mapOPCourt : Ontology.Court → Procedure.DistrictCourt

axiom corrOP_cause {p : Person} {pp : Ontology.PatternOrPractice}
    {cp : Ontology.AttorneyGeneralComplaint} {c : ComplaintText} :
    Ontology.HasReasonableCauseToBelieve p pp c →
    Procedure.AttorneyGeneralHasReasonableCause (mapOPAction cp) c

axiom corrOP_pattern {pp : Ontology.PatternOrPractice}
    {cp : Ontology.AttorneyGeneralComplaint} {c : ComplaintText} :
    Ontology.PatternOrPracticeOfResistance pp c →
    Procedure.PatternOrPracticeOfResistance (mapOPAction cp) c

axiom corrOP_intent {pp : Ontology.PatternOrPractice}
    {cp : Ontology.AttorneyGeneralComplaint} {c : ComplaintText} :
    Ontology.IsIntendedToDenyFullExercise pp c →
    Procedure.PatternIntendedToDenyFullExercise (mapOPAction cp) c

axiom corrOP_forum {ct : Ontology.Court} {cp : Ontology.AttorneyGeneralComplaint}
    {c : ComplaintText} :
    Ontology.IsAppropriateDistrictCourt ct c →
    Procedure.FiledInAppropriateDistrictCourt (mapOPAction cp) (mapOPCourt ct) c

axiom corrOP_signed {cp : Ontology.AttorneyGeneralComplaint} {p : Person}
    {c : ComplaintText} :
    Ontology.IsSignedByOfficer cp p c →
    Procedure.ComplaintSignedByAttorneyGeneral (mapOPAction cp) c

axiom corrOP_facts {cp : Ontology.AttorneyGeneralComplaint} {pp : Ontology.PatternOrPractice}
    {c : ComplaintText} :
    Ontology.SetsForthPatternOrPracticeFacts cp pp c →
    Procedure.ComplaintSetsForthPatternFacts (mapOPAction cp) c

axiom corrOP_relief {cp : Ontology.AttorneyGeneralComplaint} {r : Ontology.Relief}
    {c : ComplaintText} :
    Ontology.RequestsRelief cp r c → Ontology.IsPreventiveRelief r c →
    Procedure.ComplaintRequestsPreventiveRelief (mapOPAction cp) c


theorem s2000a5_ontology_implies_procedure
    {cp : Ontology.AttorneyGeneralComplaint} {p : Person} {pp : Ontology.PatternOrPractice}
    {r : Ontology.Relief} {ct : Ontology.Court} {c : ComplaintText}
    (h : Ontology.AttorneyGeneralComplaintMembership cp p pp r ct c) :
    Procedure.ProperlyFiledPatternPracticeComplaint (mapOPAction cp) (mapOPCourt ct) c :=
  ⟨⟨corrOP_cause (cp := cp) h.reasonableCause, corrOP_pattern (cp := cp) h.resistance,
    corrOP_intent (cp := cp) h.resistance.intent⟩,
   corrOP_forum h.forum, corrOP_signed h.signed, corrOP_facts h.facts,
   corrOP_relief h.requests h.reliefKind⟩





axiom mapEPThreeJudge : Elements.Pleading → Procedure.ThreeJudgeCourt

axiom corrEP_request {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.ThreeJudgeCourtRequestFiled pl c →
    Procedure.ThreeJudgeRequestFiledWithClerk (mapEPAction pl) c

axiom corrEP_certificate {pl : Elements.Pleading} {c : ComplaintText} :
    Elements.CertificateOfGeneralPublicImportanceFiled pl c →
    Procedure.CertificateOfGeneralPublicImportanceFiled (mapEPAction pl) c







theorem s2000a5_elements_implies_procedure_subsecB_modulo_gaps
    {d : Person} {pp : Elements.PatternOrPractice} {pl : Elements.Pleading}
    {c : ComplaintText}
    (h : Elements.Section2000a5ThreeJudgeCourt d pp pl c)
    (gap_clerkFurnished :
      Procedure.ClerkFurnishedRequestToChiefCircuitJudge (mapEPAction pl) c)
    (gap_designated :
      Procedure.ChiefCircuitJudgeDesignatedPanel (mapEPAction pl) (mapEPThreeJudge pl) c)
    (gap_composition : Procedure.ThreeJudgePanelProperlyComposed (mapEPThreeJudge pl) c) :
    Procedure.ThreeJudgeCourtConvened (mapEPAction pl) (mapEPThreeJudge pl) c :=
  ⟨corrEP_request h.requestFiled, corrEP_certificate h.certificate,
   gap_clerkFurnished, gap_designated, gap_composition⟩

end S2000a5






namespace S2000d1



axiom mapEDAddressee : Elements.FederalAgency → Deontic.Addressee
axiom mapEDAction : Elements.EnforcementAction → Deontic.EnforcementAction

axiom corrED_addressee {ag : Elements.FederalAgency} {c : ComplaintText} :
    Elements.IsFederalFundingAgency ag c →
    Deontic.AddresseeIsFederalFundingAgency (mapEDAddressee ag) c

axiom corrED_pursuant {req : Elements.Requirement} {ag : Elements.FederalAgency}
    {act : Elements.EnforcementAction} {c : ComplaintText} :
    Elements.RequirementAdoptedByRuleOfGeneralApplicability req ag c →
    Deontic.CondActionTakenPursuantToSection2000d1 (mapEDAction act) c

axiom corrED_finding {r : Elements.Recipient} {act : Elements.EnforcementAction}
    {c : ComplaintText} :
    Elements.ExpressFindingOfNoncomplianceOnRecord r act c →
    Elements.OpportunityForHearingAfforded r act c →
    Deontic.CondExpressFindingOnRecordAfterHearing (mapEDAction act) c

axiom corrED_effected {ag : Elements.FederalAgency} {act : Elements.EnforcementAction}
    {c : ComplaintText} :
    Elements.TerminationLimitedToFoundRecipient act c →
    Elements.TerminationLimitedToFoundProgram act c →
    Deontic.ActEffectedComplianceByTerminationOrRefusal
      (mapEDAddressee ag) (mapEDAction act) c



theorem s2000d1_elements_implies_deontic
    {ag : Elements.FederalAgency} {req : Elements.Requirement} {r : Elements.Recipient}
    {act : Elements.EnforcementAction} {c : ComplaintText}
    (hp : Elements.EffectuationPrerequisites ag req c)
    (ht : Elements.TerminationRoute r req act c) :
    Deontic.Power2000d1EffectComplianceExercised (mapEDAddressee ag) (mapEDAction act) c :=
  ⟨⟨corrED_addressee hp.agency, corrED_pursuant (act := act) hp.adoptedByRule,
    corrED_finding ht.expressFinding ht.hearingOpportunity⟩,
   corrED_effected (ag := ag) ht.limitedToRecipient ht.limitedToProgram⟩



axiom mapEOAgency : Elements.FederalAgency → Ontology.FederalAgency
axiom mapEOIssuance : Elements.Requirement → Ontology.AgencyIssuance

axiom corrEO_agency {ag : Elements.FederalAgency} {c : ComplaintText} :
    Elements.IsFederalFundingAgency ag c → Ontology.IsFederalFundingAgency (mapEOAgency ag) c

axiom corrEO_isIssuance {req : Elements.Requirement} {ag : Elements.FederalAgency}
    {c : ComplaintText} :
    Elements.RequirementAdoptedByRuleOfGeneralApplicability req ag c →
    Ontology.IsRuleRegulationOrOrder (mapEOIssuance req) c

axiom corrEO_generalApplicability {req : Elements.Requirement} {ag : Elements.FederalAgency}
    {c : ComplaintText} :
    Elements.RequirementAdoptedByRuleOfGeneralApplicability req ag c →
    Ontology.IsOfGeneralApplicability (mapEOIssuance req) c

axiom corrEO_consistent {req : Elements.Requirement} {c : ComplaintText} :
    Elements.RuleConsistentWithStatutoryObjectives req c →
    Ontology.IsConsistentWithStatutoryObjectives (mapEOIssuance req) c

axiom corrEO_approved {req : Elements.Requirement} {c : ComplaintText} :
    Elements.RuleApprovedByPresident req c →
    Ontology.IsApprovedByPresident (mapEOIssuance req) c







theorem s2000d1_elements_implies_ontology_modulo_gaps
    {ag : Elements.FederalAgency} {req : Elements.Requirement}
    {i : Ontology.AssistanceInstrument} {c : ComplaintText}
    (hp : Elements.EffectuationPrerequisites ag req c)
    (gap_assistanceInstrument : Ontology.IsCoveredAssistanceMode i c) :
    Ontology.FundingAgencyRulemaking (mapEOAgency ag) (mapEOIssuance req) i c :=
  ⟨corrEO_agency hp.agency, gap_assistanceInstrument,
   ⟨corrEO_isIssuance hp.adoptedByRule, corrEO_generalApplicability hp.adoptedByRule,
    corrEO_consistent hp.consistent, corrEO_approved hp.presidentApproved⟩⟩



axiom mapEPAgency : Elements.FederalAgency → Procedure.FederalAgency
axiom mapEPRecipient : Elements.Recipient → Procedure.Recipient
axiom mapEPRule : Elements.Requirement → Procedure.AgencyRule
axiom mapEPReport : Elements.EnforcementAction → Procedure.CongressionalReport
axiom mapEPAction : Elements.EnforcementAction → Procedure.EnforcementAction

axiom corrEP_empowered {ag : Elements.FederalAgency} {c : ComplaintText} :
    Elements.IsFederalFundingAgency ag c →
    Procedure.AgencyEmpoweredToExtendAssistance (mapEPAgency ag) c

axiom corrEP_issued {req : Elements.Requirement} {ag : Elements.FederalAgency}
    {c : ComplaintText} :
    Elements.RequirementAdoptedByRuleOfGeneralApplicability req ag c →
    Procedure.RuleOfGeneralApplicabilityIssued (mapEPAgency ag) (mapEPRule req) c

axiom corrEP_consistent {req : Elements.Requirement} {c : ComplaintText} :
    Elements.RuleConsistentWithStatutoryObjectives req c →
    Procedure.RuleConsistentWithAuthorizingStatuteObjectives (mapEPRule req) c

axiom corrEP_approved {req : Elements.Requirement} {c : ComplaintText} :
    Elements.RuleApprovedByPresident req c →
    Procedure.RuleApprovedByPresident (mapEPRule req) c

axiom corrEP_hearing {r : Elements.Recipient} {act : Elements.EnforcementAction}
    {c : ComplaintText} :
    Elements.OpportunityForHearingAfforded r act c →
    Procedure.OpportunityForHearingAfforded (mapEPRecipient r) c

axiom corrEP_finding {r : Elements.Recipient} {req : Elements.Requirement}
    {act : Elements.EnforcementAction} {c : ComplaintText} :
    Elements.ExpressFindingOfNoncomplianceOnRecord r act c →
    Elements.RecipientFailedToComplyWithRequirement r req c →
    Procedure.ExpressFindingOnRecordOfNoncompliance (mapEPRecipient r) (mapEPRule req) c

axiom corrEP_advised {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {act : Elements.EnforcementAction} {c : ComplaintText} :
    Elements.AdvisedOfFailureToComply r act c →
    Procedure.RecipientAdvisedOfFailureToComply (mapEPAgency ag) (mapEPRecipient r) c

axiom corrEP_voluntary {ag : Elements.FederalAgency} {r : Elements.Recipient}
    {act : Elements.EnforcementAction} {c : ComplaintText} :
    Elements.VoluntaryComplianceDeterminedUnavailable r act c →
    Procedure.VoluntaryComplianceDeterminedUnobtainable (mapEPAgency ag) (mapEPRecipient r) c

axiom corrEP_limitRecipient {r : Elements.Recipient} {act : Elements.EnforcementAction}
    {c : ComplaintText} :
    Elements.TerminationLimitedToFoundRecipient act c →
    Procedure.TerminationLimitedToFoundRecipient (mapEPAction act) (mapEPRecipient r) c

axiom corrEP_limitProgram {pa : Procedure.ProgramOrActivity} {act : Elements.EnforcementAction}
    {c : ComplaintText} :
    Elements.TerminationLimitedToFoundProgram act c →
    Procedure.TerminationLimitedToFoundProgram (mapEPAction act) pa c

axiom corrEP_report {ag : Elements.FederalAgency} {act : Elements.EnforcementAction}
    {c : ComplaintText} :
    Elements.WrittenReportFiledWithCongressionalCommittees act c →
    Procedure.FullWrittenReportFiledWithCommittees
      (mapEPAgency ag) (mapEPReport act) (mapEPAction act) c




axiom corrEP_days {act : Elements.EnforcementAction} {c : ComplaintText} :
    30 ≤ Elements.daysFromReportFilingToEffectiveDate act c →
    Procedure.reportWaitingPeriodDays ≤
      Procedure.daysFromReportFilingToActionEffective (mapEPReport act) (mapEPAction act) c






theorem s2000d1_elements_implies_procedure_modulo_gaps
    {ag : Elements.FederalAgency} {req : Elements.Requirement} {r : Elements.Recipient}
    {act : Elements.EnforcementAction} {pa : Procedure.ProgramOrActivity}
    {c : ComplaintText}
    (hp : Elements.EffectuationPrerequisites ag req c)
    (hs : Elements.Section2000d1 ag req r act c)
    (ht : Elements.TerminationRoute r req act c)
    (gap_nexus : Procedure.CoveredFederalAssistanceNexus (mapEPRecipient r) pa c) :
    Procedure.LawfulFundTermination (mapEPAgency ag) (mapEPRecipient r) pa
      (mapEPRule req) (mapEPReport act) (mapEPAction act) c :=
  ⟨⟨corrEP_empowered hp.agency, corrEP_issued hp.adoptedByRule,
    corrEP_consistent hp.consistent, corrEP_approved hp.presidentApproved⟩,
   gap_nexus,
   ⟨corrEP_hearing ht.hearingOpportunity,
    corrEP_finding ht.expressFinding ht.noncompliance⟩,
   ⟨corrEP_advised (ag := ag) hs.advised, corrEP_voluntary (ag := ag) hs.voluntaryUnavailable⟩,
   corrEP_limitRecipient (r := r) ht.limitedToRecipient,
   corrEP_limitProgram (pa := pa) ht.limitedToProgram,
   ⟨corrEP_report (ag := ag) ht.reportFiled, corrEP_days ht.thirtyDaysElapsed⟩⟩



axiom mapDOAgency : Deontic.Addressee → Ontology.FederalAgency
axiom mapDOIssuance : Deontic.Rule → Ontology.AgencyIssuance
axiom mapDOInstrument : Deontic.Recipient → Ontology.AssistanceInstrument

axiom corrDO_agency {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.AddresseeIsFederalFundingAgency a c →
    Deontic.CondAgencyEmpoweredToExtendFederalFinancialAssistance a c →
    Ontology.IsFederalFundingAgency (mapDOAgency a) c

axiom corrDO_instrument {r : Deontic.Recipient} {c : ComplaintText} :
    Deontic.CondAssistanceByGrantLoanOrContractNotInsuranceOrGuaranty r c →
    Ontology.IsCoveredAssistanceMode (mapDOInstrument r) c

axiom corrDO_isIssuance {a : Deontic.Addressee} {ru : Deontic.Rule} {c : ComplaintText} :
    Deontic.ActIssuedRuleEffectuatingSection2000d a ru c →
    Ontology.IsRuleRegulationOrOrder (mapDOIssuance ru) c

axiom corrDO_generalApplicability {a : Deontic.Addressee} {ru : Deontic.Rule}
    {c : ComplaintText} :
    Deontic.ActIssuedRuleEffectuatingSection2000d a ru c →
    Ontology.IsOfGeneralApplicability (mapDOIssuance ru) c

axiom corrDO_consistent {ru : Deontic.Rule} {c : ComplaintText} :
    Deontic.ActRuleConsistentWithStatutoryObjectives ru c →
    Ontology.IsConsistentWithStatutoryObjectives (mapDOIssuance ru) c

axiom corrDO_approved {ru : Deontic.Rule} {c : ComplaintText} :
    Deontic.CondRuleApprovedByPresident ru c →
    Ontology.IsApprovedByPresident (mapDOIssuance ru) c


theorem s2000d1_deontic_implies_ontology
    {a : Deontic.Addressee} {r : Deontic.Recipient} {ru : Deontic.Rule} {c : ComplaintText}
    (h : Deontic.Power2000d1RulemakingExercised a r ru c)
    (happroved : Deontic.CondRuleApprovedByPresident ru c) :
    Ontology.FundingAgencyRulemaking (mapDOAgency a) (mapDOIssuance ru) (mapDOInstrument r) c :=
  ⟨corrDO_agency h.1.addressee h.1.empowered,
   corrDO_instrument h.1.assistanceForm,
   ⟨corrDO_isIssuance h.2.1, corrDO_generalApplicability h.2.1,
    corrDO_consistent h.2.2, corrDO_approved happroved⟩⟩



axiom mapDPAgency : Deontic.Addressee → Procedure.FederalAgency
axiom mapDPRule : Deontic.Rule → Procedure.AgencyRule

axiom corrDP_empowered {a : Deontic.Addressee} {c : ComplaintText} :
    Deontic.CondAgencyEmpoweredToExtendFederalFinancialAssistance a c →
    Procedure.AgencyEmpoweredToExtendAssistance (mapDPAgency a) c

axiom corrDP_issued {a : Deontic.Addressee} {ru : Deontic.Rule} {c : ComplaintText} :
    Deontic.ActIssuedRuleEffectuatingSection2000d a ru c →
    Procedure.RuleOfGeneralApplicabilityIssued (mapDPAgency a) (mapDPRule ru) c

axiom corrDP_consistent {ru : Deontic.Rule} {c : ComplaintText} :
    Deontic.ActRuleConsistentWithStatutoryObjectives ru c →
    Procedure.RuleConsistentWithAuthorizingStatuteObjectives (mapDPRule ru) c

axiom corrDP_approved {ru : Deontic.Rule} {c : ComplaintText} :
    Deontic.CondRuleApprovedByPresident ru c →
    Procedure.RuleApprovedByPresident (mapDPRule ru) c


theorem s2000d1_deontic_implies_procedure
    {a : Deontic.Addressee} {r : Deontic.Recipient} {ru : Deontic.Rule} {c : ComplaintText}
    (h : Deontic.Power2000d1RulemakingExercised a r ru c)
    (happroved : Deontic.CondRuleApprovedByPresident ru c) :
    Procedure.EffectiveImplementingRule (mapDPAgency a) (mapDPRule ru) c :=
  ⟨corrDP_empowered h.1.empowered, corrDP_issued h.2.1, corrDP_consistent h.2.2,
   corrDP_approved happroved⟩



axiom mapOPAgency : Ontology.FederalAgency → Procedure.FederalAgency
axiom mapOPRule : Ontology.AgencyIssuance → Procedure.AgencyRule

axiom corrOP_empowered {a : Ontology.FederalAgency} {c : ComplaintText} :
    Ontology.IsFederalFundingAgency a c →
    Procedure.AgencyEmpoweredToExtendAssistance (mapOPAgency a) c

axiom corrOP_issued {a : Ontology.FederalAgency} {x : Ontology.AgencyIssuance}
    {c : ComplaintText} :
    Ontology.IsRuleRegulationOrOrder x c → Ontology.IsOfGeneralApplicability x c →
    Procedure.RuleOfGeneralApplicabilityIssued (mapOPAgency a) (mapOPRule x) c

axiom corrOP_consistent {x : Ontology.AgencyIssuance} {c : ComplaintText} :
    Ontology.IsConsistentWithStatutoryObjectives x c →
    Procedure.RuleConsistentWithAuthorizingStatuteObjectives (mapOPRule x) c

axiom corrOP_approved {x : Ontology.AgencyIssuance} {c : ComplaintText} :
    Ontology.IsApprovedByPresident x c → Procedure.RuleApprovedByPresident (mapOPRule x) c


theorem s2000d1_ontology_implies_procedure
    {a : Ontology.FederalAgency} {x : Ontology.AgencyIssuance}
    {i : Ontology.AssistanceInstrument} {c : ComplaintText}
    (h : Ontology.FundingAgencyRulemaking a x i c) :
    Procedure.EffectiveImplementingRule (mapOPAgency a) (mapOPRule x) c :=
  ⟨corrOP_empowered h.agency,
   corrOP_issued (a := a) h.issuance.issuance h.issuance.generalApplicability,
   corrOP_consistent h.issuance.consistency, corrOP_approved h.issuance.presidentialApproval⟩

end S2000d1












namespace S2000d7



axiom mapDEPerson : Deontic.Addressee → Person
axiom mapDEViolation : Deontic.Proceeding → Elements.Violation

axiom corrDE_state {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.AddresseeIsStateSuedInFederalCourt a pr c →
    Elements.DefendantIsState (mapDEPerson a) c





axiom corrDE_covered {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.CondSuitForViolationOfCoveredAntidiscriminationStatute pr c →
    Elements.CoveredAntidiscriminationViolation (mapDEViolation pr) c

axiom corrDE_timing {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.CondViolationOccursAfterOctober211986 pr c →
    Elements.abrogationEffectiveDay < Elements.violationLatestConductDay (mapDEViolation pr) c


theorem s2000d7_deontic_implies_elements
    {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText}
    (h : Deontic.Power2000d7ImmunityAbrogated a pr c) :
    Elements.Section2000d7Abrogation (mapDEPerson a) (mapDEViolation pr) c :=
  ⟨corrDE_state h.addressee, corrDE_covered h.coveredStatute,
   corrDE_timing h.afterEffectiveDate⟩



axiom mapEOEntity : Person → Entity
axiom mapEOStatute : Elements.Violation → Ontology.FederalStatute
axiom mapEOViolation : Elements.Violation → Ontology.Violation

axiom corrEO_state {d : Person} {c : ComplaintText} :
    Elements.DefendantIsState d c → Ontology.IsState (mapEOEntity d) c

axiom corrEO_rehab {v : Elements.Violation} {c : ComplaintText} :
    Elements.ViolationOfRehabilitationActSection504 v c →
    Ontology.IsRehabilitationActSection504 (mapEOStatute v) c

axiom corrEO_titleIX {v : Elements.Violation} {c : ComplaintText} :
    Elements.ViolationOfTitleIX v c →
    Ontology.IsTitleIXEducationAmendments1972 (mapEOStatute v) c

axiom corrEO_ageAct {v : Elements.Violation} {c : ComplaintText} :
    Elements.ViolationOfAgeDiscriminationAct v c →
    Ontology.IsAgeDiscriminationAct1975 (mapEOStatute v) c

axiom corrEO_titleVI {v : Elements.Violation} {c : ComplaintText} :
    Elements.ViolationOfTitleVI v c →
    Ontology.IsTitleVICivilRightsAct1964 (mapEOStatute v) c

axiom corrEO_otherStatute {v : Elements.Violation} {c : ComplaintText} :
    Elements.ViolationOfOtherFederalFundingAntidiscriminationStatute v c →
    Ontology.IsOtherFederalStatuteProhibitingRecipientDiscrimination (mapEOStatute v) c

axiom corrEO_isViolation {d : Person} {v : Elements.Violation} {c : ComplaintText} :
    Elements.CoveredAntidiscriminationViolation v c →
    Elements.DefendantIsState d c →
    Ontology.IsViolationOfStatute (mapEOViolation v) (mapEOStatute v) (mapEOEntity d) c

axiom corrEO_timing {v : Elements.Violation} {c : ComplaintText} :
    Elements.abrogationEffectiveDay < Elements.violationLatestConductDay v c →
    Ontology.OccursInWholeOrPartAfterEffectiveDate (mapEOViolation v) c



theorem coveredStatuteRoutesAgree {v : Elements.Violation} {c : ComplaintText}
    (h : Elements.CoveredAntidiscriminationViolation v c) :
    Ontology.IsCoveredDiscriminationStatute (mapEOStatute v) c :=
  match h with
  | .rehabSection504 hx => .rehabilitationAct504 (corrEO_rehab hx)
  | .titleIX hx => .titleIXEducationAmendments1972 (corrEO_titleIX hx)
  | .ageAct hx => .ageDiscriminationAct1975 (corrEO_ageAct hx)
  | .titleVI hx => .titleVICivilRightsAct1964 (corrEO_titleVI hx)
  | .otherFundingStatute hx => .otherRecipientDiscriminationStatute (corrEO_otherStatute hx)


theorem s2000d7_elements_implies_ontology
    {d : Person} {v : Elements.Violation} {c : ComplaintText}
    (h : Elements.Section2000d7Abrogation d v c) :
    Ontology.EqualizationCoveredViolation (mapEOViolation v) (mapEOStatute v)
      (mapEOEntity d) c :=
  ⟨corrEO_state h.defendantIsState, coveredStatuteRoutesAgree h.covered,
   corrEO_isViolation h.covered h.defendantIsState, corrEO_timing h.afterEffectiveDate⟩



axiom mapPEViolation : Procedure.StateDefendant → Elements.Violation

axiom corrPE_state {p : Person} {s : Procedure.StateDefendant} {c : ComplaintText} :
    Procedure.SuitAgainstStateInFederalCourt p s c → Elements.DefendantIsState p c




axiom corrPE_covered {s : Procedure.StateDefendant} {c : ComplaintText} :
    Procedure.ViolationOfCoveredFundingStatute s c →
    Elements.CoveredAntidiscriminationViolation (mapPEViolation s) c





axiom corrPE_timing {s : Procedure.StateDefendant} {c : ComplaintText} :
    Procedure.ViolationPostdatesEqualizationCutoff s c →
    Elements.abrogationEffectiveDay < Elements.violationLatestConductDay (mapPEViolation s) c


theorem s2000d7_procedure_implies_elements
    {p : Person} {s : Procedure.StateDefendant} {c : ComplaintText}
    (h : Procedure.EleventhAmendmentAbrogation p s c) :
    Elements.Section2000d7Abrogation p (mapPEViolation s) c :=
  ⟨corrPE_state h.federalSuit, corrPE_covered h.coveredViolation,
   corrPE_timing h.postdatesCutoff⟩



axiom mapDOEntity : Deontic.Addressee → Entity
axiom mapDOStatute : Deontic.Proceeding → Ontology.FederalStatute
axiom mapDOViolation : Deontic.Proceeding → Ontology.Violation

axiom corrDO_state {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.AddresseeIsStateSuedInFederalCourt a pr c → Ontology.IsState (mapDOEntity a) c

axiom corrDO_statute {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.CondSuitForViolationOfCoveredAntidiscriminationStatute pr c →
    Ontology.IsCoveredDiscriminationStatute (mapDOStatute pr) c

axiom corrDO_violation {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.CondSuitForViolationOfCoveredAntidiscriminationStatute pr c →
    Deontic.AddresseeIsStateSuedInFederalCourt a pr c →
    Ontology.IsViolationOfStatute (mapDOViolation pr) (mapDOStatute pr) (mapDOEntity a) c

axiom corrDO_timing {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.CondViolationOccursAfterOctober211986 pr c →
    Ontology.OccursInWholeOrPartAfterEffectiveDate (mapDOViolation pr) c


theorem s2000d7_deontic_implies_ontology
    {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText}
    (h : Deontic.Power2000d7ImmunityAbrogated a pr c) :
    Ontology.EqualizationCoveredViolation (mapDOViolation pr) (mapDOStatute pr)
      (mapDOEntity a) c :=
  ⟨corrDO_state h.addressee, corrDO_statute h.coveredStatute,
   corrDO_violation h.coveredStatute h.addressee, corrDO_timing h.afterEffectiveDate⟩



axiom mapDPPerson : Deontic.Addressee → Person
axiom mapDPState : Deontic.Addressee → Procedure.StateDefendant

axiom corrDP_suit {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.AddresseeIsStateSuedInFederalCourt a pr c →
    Procedure.SuitAgainstStateInFederalCourt (mapDPPerson a) (mapDPState a) c

axiom corrDP_covered {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.CondSuitForViolationOfCoveredAntidiscriminationStatute pr c →
    Procedure.ViolationOfCoveredFundingStatute (mapDPState a) c

axiom corrDP_timing {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText} :
    Deontic.CondViolationOccursAfterOctober211986 pr c →
    Procedure.ViolationPostdatesEqualizationCutoff (mapDPState a) c


theorem s2000d7_deontic_implies_procedure
    {a : Deontic.Addressee} {pr : Deontic.Proceeding} {c : ComplaintText}
    (h : Deontic.Power2000d7ImmunityAbrogated a pr c) :
    Procedure.EleventhAmendmentAbrogation (mapDPPerson a) (mapDPState a) c :=
  ⟨corrDP_suit h.addressee, corrDP_covered (a := a) h.coveredStatute,
   corrDP_timing (a := a) h.afterEffectiveDate⟩



axiom mapPOEntity : Procedure.StateDefendant → Entity
axiom mapPOStatute : Procedure.StateDefendant → Ontology.FederalStatute
axiom mapPOViolation : Procedure.StateDefendant → Ontology.Violation

axiom corrPO_state {p : Person} {s : Procedure.StateDefendant} {c : ComplaintText} :
    Procedure.SuitAgainstStateInFederalCourt p s c → Ontology.IsState (mapPOEntity s) c

axiom corrPO_statute {s : Procedure.StateDefendant} {c : ComplaintText} :
    Procedure.ViolationOfCoveredFundingStatute s c →
    Ontology.IsCoveredDiscriminationStatute (mapPOStatute s) c

axiom corrPO_violation {p : Person} {s : Procedure.StateDefendant} {c : ComplaintText} :
    Procedure.ViolationOfCoveredFundingStatute s c →
    Procedure.SuitAgainstStateInFederalCourt p s c →
    Ontology.IsViolationOfStatute (mapPOViolation s) (mapPOStatute s) (mapPOEntity s) c

axiom corrPO_timing {s : Procedure.StateDefendant} {c : ComplaintText} :
    Procedure.ViolationPostdatesEqualizationCutoff s c →
    Ontology.OccursInWholeOrPartAfterEffectiveDate (mapPOViolation s) c


theorem s2000d7_procedure_implies_ontology
    {p : Person} {s : Procedure.StateDefendant} {c : ComplaintText}
    (h : Procedure.EleventhAmendmentAbrogation p s c) :
    Ontology.EqualizationCoveredViolation (mapPOViolation s) (mapPOStatute s)
      (mapPOEntity s) c :=
  ⟨corrPO_state h.federalSuit, corrPO_statute h.coveredViolation,
   corrPO_violation h.coveredViolation h.federalSuit, corrPO_timing h.postdatesCutoff⟩

end S2000d7

end Proving.USC.T42.Ch21CivilRights.Recert.Bridge
