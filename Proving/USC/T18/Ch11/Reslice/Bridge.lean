



























import Proving.USC.T18.Ch11.Reslice.Elements.Statute
import Proving.USC.T18.Ch11.Reslice.Deontic.Statute
import Proving.USC.T18.Ch11.Reslice.Scienter.Statute
import Proving.USC.T18.Ch11.Reslice.Procedure.Statute
import Proving.Rico.Statute
import Proving.USC.Common.Types

set_option autoImplicit false
set_option relaxedAutoImplicit false

namespace Proving.USC.T18.Ch11.Reslice.Bridge
open Proving.USC.Common
open Proving.USC.T18.Ch11.Reslice







axiom corr201b_addressee {giver : Person} {tov : Elements.ThingOfValue} {c : ComplaintText} :
    Elements.ConfersThingOfValue giver tov c → Deontic.AddresseeIsPublicOfficialOrOfferor201 giver c
axiom corr201b_condition {giver : Person} {oa : Elements.OfficialAct} {c : ComplaintText} :
    Elements.BriberyPurpose201b1 giver oa c → Deontic.IntentToInfluenceOfficialAct201b giver c
axiom corr201b_act {giver : Person} {tov : Elements.ThingOfValue} {c : ComplaintText} :
    Elements.ConfersThingOfValue giver tov c → Elements.ActsCorruptly giver c →
    Deontic.CorruptlyExchangedThingOfValue201b giver c

theorem s201_elements_implies_deontic {giver recipient : Person} {tov : Elements.ThingOfValue}
    {oa : Elements.OfficialAct} {c : ComplaintText}
    (h : Elements.Section201b1 giver recipient tov oa c) : Deontic.ProhibitionViolated201b giver c :=
  ⟨⟨corr201b_addressee h.confers, corr201b_condition h.purpose⟩, corr201b_act h.confers h.corrupt⟩

axiom corr201b_sc_corrupt {giver : Person} {c : ComplaintText} :
    Elements.ActsCorruptly giver c → Scienter.ActedCorruptly giver c
axiom corr201b_sc_met {giver : Person} {oa : Elements.OfficialAct} {c : ComplaintText} :
    Elements.BriberyPurpose201b1 giver oa c → Scienter.ScienterMet Scienter.RequiredMentalState201b giver c

theorem s201_elements_implies_scienter {giver recipient : Person} {tov : Elements.ThingOfValue}
    {oa : Elements.OfficialAct} {c : ComplaintText}
    (h : Elements.Section201b1 giver recipient tov oa c) : Scienter.Culpable201b giver c :=
  ⟨corr201b_sc_corrupt h.corrupt, corr201b_sc_met h.purpose⟩

axiom corr201b_ds_corrupt {p : Person} {c : ComplaintText} :
    Deontic.CorruptlyExchangedThingOfValue201b p c → Scienter.ActedCorruptly p c
axiom corr201b_ds_met {p : Person} {c : ComplaintText} :
    Deontic.IntentToInfluenceOfficialAct201b p c → Scienter.ScienterMet Scienter.RequiredMentalState201b p c

theorem s201_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated201b p c) : Scienter.Culpable201b p c :=
  ⟨corr201b_ds_corrupt h.2, corr201b_ds_met h.1.condition⟩

def s201_tierA_pairwise_discharge : Prop :=
  (∀ {giver recipient : Person} {tov : Elements.ThingOfValue} {oa : Elements.OfficialAct}
      {c : ComplaintText}, Elements.Section201b1 giver recipient tov oa c →
      Deontic.ProhibitionViolated201b giver c)
  ∧ (∀ {giver recipient : Person} {tov : Elements.ThingOfValue} {oa : Elements.OfficialAct}
      {c : ComplaintText}, Elements.Section201b1 giver recipient tov oa c →
      Scienter.Culpable201b giver c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated201b p c → Scienter.Culpable201b p c)


theorem s201_tierA : s201_tierA_pairwise_discharge :=
  ⟨fun h => s201_elements_implies_deontic h,
   fun h => s201_elements_implies_scienter h,
   fun h => s201_deontic_implies_scienter h⟩



axiom corr203_addr {p : Person} {c : ComplaintText} :
    (Elements.IsMemberOfCongress p c ∨ Elements.IsOfficerOrEmployeeOfUS p c) →
    Deontic.AddresseeIsFederalOfficerOrEmployee p c
axiom corr203_cond {pm : Elements.ParticularMatter} {c : ComplaintText} :
    Elements.MatterInWhichUSHasInterest pm c → Deontic.MatterInWhichUSHasInterest203 c
axiom corr203_act {p : Person} {comp : Elements.RepresentationalCompensation} {c : ComplaintText} :
    (Elements.DemandsOrReceivesRepresentationalCompensation p comp c
      ∨ Elements.GivesRepresentationalCompensation p comp c) →
    Deontic.SoughtOrReceivedCompensationForRepresentation203 p c

theorem s203_elements_implies_deontic {party : Person} {comp : Elements.RepresentationalCompensation}
    {pm : Elements.ParticularMatter} {c : ComplaintText}
    (h : Elements.Section203a party comp pm c) : Deontic.ProhibitionViolated203 party c :=
  ⟨⟨corr203_addr h.coveredPerson, corr203_cond h.matter⟩, corr203_act h.act⟩

axiom corr203_sc {p : Person} {comp : Elements.RepresentationalCompensation} {c : ComplaintText} :
    (Elements.DemandsOrReceivesRepresentationalCompensation p comp c
      ∨ Elements.GivesRepresentationalCompensation p comp c) →
    Scienter.ScienterMet Scienter.RequiredMentalState203 p c

theorem s203_elements_implies_scienter {party : Person} {comp : Elements.RepresentationalCompensation}
    {pm : Elements.ParticularMatter} {c : ComplaintText}
    (h : Elements.Section203a party comp pm c) : Scienter.Culpable203 party c :=
  corr203_sc h.act

axiom corr203_ds {p : Person} {c : ComplaintText} :
    Deontic.SoughtOrReceivedCompensationForRepresentation203 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState203 p c

theorem s203_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated203 p c) : Scienter.Culpable203 p c :=
  corr203_ds h.2

def s203_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {comp : Elements.RepresentationalCompensation} {pm : Elements.ParticularMatter}
      {c : ComplaintText}, Elements.Section203a party comp pm c → Deontic.ProhibitionViolated203 party c)
  ∧ (∀ {party : Person} {comp : Elements.RepresentationalCompensation} {pm : Elements.ParticularMatter}
      {c : ComplaintText}, Elements.Section203a party comp pm c → Scienter.Culpable203 party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated203 p c → Scienter.Culpable203 p c)

theorem s203_tierA : s203_tierA_pairwise_discharge :=
  ⟨fun h => s203_elements_implies_deontic h,
   fun h => s203_elements_implies_scienter h,
   fun h => s203_deontic_implies_scienter h⟩



axiom corr207_addr {p : Person} {c : ComplaintText} :
    Elements.IsFormerOfficerOrEmployee p c → Deontic.AddresseeIsFormerFederalOfficer p c
axiom corr207_cond {p : Person} {pm : Elements.ParticularMatter} {c : ComplaintText} :
    Elements.ParticipatedPersonallyAndSubstantially p pm c →
    Deontic.ParticularMatterPriorParticipation207 p c
axiom corr207_act {p : Person} {comm : Elements.Communication} {c : ComplaintText} :
    Elements.MakesCommunicationWithIntentToInfluence p comm c →
    Deontic.MadeInfluenceCommunicationPostEmployment207 p c

theorem s207_elements_implies_deontic {party : Person} {comm : Elements.Communication}
    {pm : Elements.ParticularMatter} {c : ComplaintText}
    (h : Elements.Section207a1 party comm pm c) : Deontic.ProhibitionViolated207 party c :=
  ⟨⟨corr207_addr h.former, corr207_cond h.participated⟩, corr207_act h.communication⟩

axiom corr207_sc {p : Person} {comm : Elements.Communication} {c : ComplaintText} :
    Elements.MakesCommunicationWithIntentToInfluence p comm c →
    Scienter.ScienterMet Scienter.RequiredMentalState207 p c

theorem s207_elements_implies_scienter {party : Person} {comm : Elements.Communication}
    {pm : Elements.ParticularMatter} {c : ComplaintText}
    (h : Elements.Section207a1 party comm pm c) : Scienter.Culpable207 party c :=
  corr207_sc h.communication

axiom corr207_ds {p : Person} {c : ComplaintText} :
    Deontic.MadeInfluenceCommunicationPostEmployment207 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState207 p c

theorem s207_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated207 p c) : Scienter.Culpable207 p c :=
  corr207_ds h.2

def s207_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {comm : Elements.Communication} {pm : Elements.ParticularMatter}
      {c : ComplaintText}, Elements.Section207a1 party comm pm c → Deontic.ProhibitionViolated207 party c)
  ∧ (∀ {party : Person} {comm : Elements.Communication} {pm : Elements.ParticularMatter}
      {c : ComplaintText}, Elements.Section207a1 party comm pm c → Scienter.Culpable207 party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated207 p c → Scienter.Culpable207 p c)

theorem s207_tierA : s207_tierA_pairwise_discharge :=
  ⟨fun h => s207_elements_implies_deontic h,
   fun h => s207_elements_implies_scienter h,
   fun h => s207_deontic_implies_scienter h⟩



axiom corr208_addr {p : Person} {c : ComplaintText} :
    Elements.IsOfficerOrEmployeeOfUS p c → Deontic.AddresseeIsFederalOfficerOrEmployee p c
axiom corr208_cond {p : Person} {fi : Elements.FinancialInterest} {pm : Elements.ParticularMatter}
    {c : ComplaintText} :
    Elements.HasFinancialInterestInMatter p fi pm c → Deontic.PersonalFinancialInterestKnown208 p c
axiom corr208_act {p : Person} {pm : Elements.ParticularMatter} {c : ComplaintText} :
    Elements.ParticipatedPersonallyAndSubstantially p pm c →
    Deontic.ParticipatedPersonallyAndSubstantially208 p c

theorem s208_elements_implies_deontic {party : Person} {fi : Elements.FinancialInterest}
    {pm : Elements.ParticularMatter} {c : ComplaintText}
    (h : Elements.Section208a party fi pm c) : Deontic.ProhibitionViolated208 party c :=
  ⟨⟨corr208_addr h.officer, corr208_cond h.interest⟩, corr208_act h.participated⟩

axiom corr208_sc {p : Person} {fi : Elements.FinancialInterest} {pm : Elements.ParticularMatter}
    {c : ComplaintText} :
    Elements.HasFinancialInterestInMatter p fi pm c →
    Scienter.ScienterMet Scienter.RequiredMentalState208 p c

theorem s208_elements_implies_scienter {party : Person} {fi : Elements.FinancialInterest}
    {pm : Elements.ParticularMatter} {c : ComplaintText}
    (h : Elements.Section208a party fi pm c) : Scienter.Culpable208 party c :=
  corr208_sc h.interest

axiom corr208_ds {p : Person} {c : ComplaintText} :
    Deontic.PersonalFinancialInterestKnown208 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState208 p c

theorem s208_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated208 p c) : Scienter.Culpable208 p c :=
  corr208_ds h.1.condition

def s208_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {fi : Elements.FinancialInterest} {pm : Elements.ParticularMatter}
      {c : ComplaintText}, Elements.Section208a party fi pm c → Deontic.ProhibitionViolated208 party c)
  ∧ (∀ {party : Person} {fi : Elements.FinancialInterest} {pm : Elements.ParticularMatter}
      {c : ComplaintText}, Elements.Section208a party fi pm c → Scienter.Culpable208 party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated208 p c → Scienter.Culpable208 p c)

theorem s208_tierA : s208_tierA_pairwise_discharge :=
  ⟨fun h => s208_elements_implies_deontic h,
   fun h => s208_elements_implies_scienter h,
   fun h => s208_deontic_implies_scienter h⟩



axiom corr210_addr {p : Person} {office : Elements.AppointiveOffice} {c : ComplaintText} :
    Elements.OffersValueToProcureAppointiveOffice p office c → Deontic.AddresseeAnyPerson p c
axiom corr210_act {p : Person} {office : Elements.AppointiveOffice} {c : ComplaintText} :
    Elements.OffersValueToProcureAppointiveOffice p office c →
    Deontic.OfferedValueToProcureAppointiveOffice210 p c

theorem s210_elements_implies_deontic {party : Person} {office : Elements.AppointiveOffice}
    {c : ComplaintText}
    (h : Elements.Section210 party office c) : Deontic.ProhibitionViolated210 party c :=
  ⟨⟨corr210_addr h.offers⟩, corr210_act h.offers⟩

axiom corr210_sc {p : Person} {office : Elements.AppointiveOffice} {c : ComplaintText} :
    Elements.OffersValueToProcureAppointiveOffice p office c →
    Scienter.ScienterMet Scienter.RequiredMentalState210 p c

theorem s210_elements_implies_scienter {party : Person} {office : Elements.AppointiveOffice}
    {c : ComplaintText}
    (h : Elements.Section210 party office c) : Scienter.Culpable210 party c :=
  corr210_sc h.offers

axiom corr210_ds {p : Person} {c : ComplaintText} :
    Deontic.OfferedValueToProcureAppointiveOffice210 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState210 p c

theorem s210_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated210 p c) : Scienter.Culpable210 p c :=
  corr210_ds h.2

def s210_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {office : Elements.AppointiveOffice} {c : ComplaintText},
      Elements.Section210 party office c → Deontic.ProhibitionViolated210 party c)
  ∧ (∀ {party : Person} {office : Elements.AppointiveOffice} {c : ComplaintText},
      Elements.Section210 party office c → Scienter.Culpable210 party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated210 p c → Scienter.Culpable210 p c)

theorem s210_tierA : s210_tierA_pairwise_discharge :=
  ⟨fun h => s210_elements_implies_deontic h,
   fun h => s210_elements_implies_scienter h,
   fun h => s210_deontic_implies_scienter h⟩



axiom corr215_addr {p : Person} {tov : Elements.ThingOfValue} {c : ComplaintText} :
    Elements.ConfersThingOfValue p tov c → Deontic.AddresseeIsFinancialInstitutionInsiderOrOfferor215 p c
axiom corr215_act {p : Person} {c : ComplaintText} :
    Elements.ActsCorruptly p c → Elements.IntentToInfluenceOrRewardInsider p c →
    Deontic.CorruptlyExchangedValueForBankBusiness215 p c

theorem s215_elements_implies_deontic {giver : Person} {tov : Elements.ThingOfValue}
    {fi : Elements.FinancialInstitution} {c : ComplaintText}
    (h : Elements.Section215Give giver tov fi c) : Deontic.ProhibitionViolated215 giver c :=
  ⟨⟨corr215_addr h.confers⟩, corr215_act h.corrupt h.intent⟩

axiom corr215_sc_corrupt {p : Person} {c : ComplaintText} :
    Elements.ActsCorruptly p c → Scienter.ActedCorruptly p c
axiom corr215_sc_met {p : Person} {c : ComplaintText} :
    Elements.IntentToInfluenceOrRewardInsider p c →
    Scienter.ScienterMet Scienter.RequiredMentalState215 p c

theorem s215_elements_implies_scienter {giver : Person} {tov : Elements.ThingOfValue}
    {fi : Elements.FinancialInstitution} {c : ComplaintText}
    (h : Elements.Section215Give giver tov fi c) : Scienter.Culpable215 giver c :=
  ⟨corr215_sc_corrupt h.corrupt, corr215_sc_met h.intent⟩

axiom corr215_ds_corrupt {p : Person} {c : ComplaintText} :
    Deontic.CorruptlyExchangedValueForBankBusiness215 p c → Scienter.ActedCorruptly p c
axiom corr215_ds_met {p : Person} {c : ComplaintText} :
    Deontic.CorruptlyExchangedValueForBankBusiness215 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState215 p c

theorem s215_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated215 p c) : Scienter.Culpable215 p c :=
  ⟨corr215_ds_corrupt h.2, corr215_ds_met h.2⟩

def s215_tierA_pairwise_discharge : Prop :=
  (∀ {giver : Person} {tov : Elements.ThingOfValue} {fi : Elements.FinancialInstitution}
      {c : ComplaintText}, Elements.Section215Give giver tov fi c → Deontic.ProhibitionViolated215 giver c)
  ∧ (∀ {giver : Person} {tov : Elements.ThingOfValue} {fi : Elements.FinancialInstitution}
      {c : ComplaintText}, Elements.Section215Give giver tov fi c → Scienter.Culpable215 giver c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated215 p c → Scienter.Culpable215 p c)

theorem s215_tierA : s215_tierA_pairwise_discharge :=
  ⟨fun h => s215_elements_implies_deontic h,
   fun h => s215_elements_implies_scienter h,
   fun h => s215_deontic_implies_scienter h⟩



axiom corr220_addr {p : Person} {rem : Elements.Remuneration} {ref : Elements.Referral}
    {c : ComplaintText} :
    (Elements.SolicitsRemunerationForReferral p rem ref c
      ∨ Elements.PaysRemunerationToInduceReferral p rem ref c) → Deontic.AddresseeAnyPerson p c
axiom corr220_cond {c : ComplaintText} :
    Elements.AffectsInterstateOrForeignCommerce c → Deontic.HealthProgramInterstateCommerce220 c
axiom corr220_act {p : Person} {rem : Elements.Remuneration} {ref : Elements.Referral}
    {c : ComplaintText} :
    (Elements.SolicitsRemunerationForReferral p rem ref c
      ∨ Elements.PaysRemunerationToInduceReferral p rem ref c) →
    Deontic.KnowinglyPaidOrSolicitedReferralRemuneration220 p c

theorem s220_elements_implies_deontic {party : Person} {rem : Elements.Remuneration}
    {ref : Elements.Referral} {c : ComplaintText}
    (h : Elements.Section220 party rem ref c) : Deontic.ProhibitionViolated220 party c :=
  ⟨⟨corr220_addr h.act, corr220_cond h.commerce⟩, corr220_act h.act⟩

axiom corr220_sc {p : Person} {c : ComplaintText} :
    Elements.KnowinglyAndWillfully p c → Scienter.ScienterMet Scienter.RequiredMentalState220 p c

theorem s220_elements_implies_scienter {party : Person} {rem : Elements.Remuneration}
    {ref : Elements.Referral} {c : ComplaintText}
    (h : Elements.Section220 party rem ref c) : Scienter.Culpable220 party c :=
  corr220_sc h.scienter

axiom corr220_ds {p : Person} {c : ComplaintText} :
    Deontic.KnowinglyPaidOrSolicitedReferralRemuneration220 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState220 p c

theorem s220_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated220 p c) : Scienter.Culpable220 p c :=
  corr220_ds h.2

def s220_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {rem : Elements.Remuneration} {ref : Elements.Referral} {c : ComplaintText},
      Elements.Section220 party rem ref c → Deontic.ProhibitionViolated220 party c)
  ∧ (∀ {party : Person} {rem : Elements.Remuneration} {ref : Elements.Referral} {c : ComplaintText},
      Elements.Section220 party rem ref c → Scienter.Culpable220 party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated220 p c → Scienter.Culpable220 p c)

theorem s220_tierA : s220_tierA_pairwise_discharge :=
  ⟨fun h => s220_elements_implies_deontic h,
   fun h => s220_elements_implies_scienter h,
   fun h => s220_deontic_implies_scienter h⟩



axiom corr224_addr {p : Person} {sc : Elements.BriberyScheme} {c : ComplaintText} :
    Elements.CarriesOutSchemeToInfluenceContest p sc c → Deontic.AddresseeAnyPerson p c
axiom corr224_cond {sc : Elements.BriberyScheme} {c : ComplaintText} :
    Elements.SchemeInCommerce sc c → Deontic.SchemeInInterstateCommerce224 c
axiom corr224_act {p : Person} {sc : Elements.BriberyScheme} {c : ComplaintText} :
    Elements.CarriesOutSchemeToInfluenceContest p sc c → Deontic.SchemeToBribeSportingContest224 p c

theorem s224_elements_implies_deontic {party : Person} {sc : Elements.BriberyScheme}
    {target : Elements.SportingContest} {c : ComplaintText}
    (h : Elements.Section224 party sc target c) : Deontic.ProhibitionViolated224 party c :=
  ⟨⟨corr224_addr h.scheme, corr224_cond h.commerce⟩, corr224_act h.scheme⟩

axiom corr224_sc {p : Person} {sc : Elements.BriberyScheme} {c : ComplaintText} :
    Elements.KnowsSchemePurposeIsBribery p sc c → Scienter.ScienterMet Scienter.RequiredMentalState224 p c

theorem s224_elements_implies_scienter {party : Person} {sc : Elements.BriberyScheme}
    {target : Elements.SportingContest} {c : ComplaintText}
    (h : Elements.Section224 party sc target c) : Scienter.Culpable224 party c :=
  corr224_sc h.knowledge

axiom corr224_ds {p : Person} {c : ComplaintText} :
    Deontic.SchemeToBribeSportingContest224 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState224 p c

theorem s224_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated224 p c) : Scienter.Culpable224 p c :=
  corr224_ds h.2

def s224_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {sc : Elements.BriberyScheme} {target : Elements.SportingContest}
      {c : ComplaintText}, Elements.Section224 party sc target c → Deontic.ProhibitionViolated224 party c)
  ∧ (∀ {party : Person} {sc : Elements.BriberyScheme} {target : Elements.SportingContest}
      {c : ComplaintText}, Elements.Section224 party sc target c → Scienter.Culpable224 party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated224 p c → Scienter.Culpable224 p c)


theorem s224_tierA : s224_tierA_pairwise_discharge :=
  ⟨fun h => s224_elements_implies_deontic h,
   fun h => s224_elements_implies_scienter h,
   fun h => s224_deontic_implies_scienter h⟩






axiom corr225_addr {p : Person} {ce : Elements.CrimesEnterprise} {c : ComplaintText} :
    Elements.OrganizesManagesSupervisesEnterprise p ce c → Deontic.AddresseeAnyPerson p c
axiom corr225_cond {p : Person} {ce : Elements.CrimesEnterprise} {c : ComplaintText} :
    Elements.GrossReceiptsAtLeast5M p ce c → Deontic.ReceivedFiveMillionOver24Months225 p c
axiom corr225_act {p : Person} {ce : Elements.CrimesEnterprise} {c : ComplaintText} :
    Elements.OrganizesManagesSupervisesEnterprise p ce c →
    Deontic.OrganizedContinuingFinancialCrimesEnterprise225 p c

theorem s225_elements_implies_deontic {party : Person} {ce : Elements.CrimesEnterprise}
    {c : ComplaintText}
    (h : Elements.Section225 party ce c) : Deontic.ProhibitionViolated225 party c :=
  ⟨⟨corr225_addr h.organizes, corr225_cond h.receipts⟩, corr225_act h.organizes⟩

axiom corr225_proc_series {p : Person} {ce : Elements.CrimesEnterprise} {c : ComplaintText} :
    Elements.SeriesOfEnumeratedFinancialViolations ce c → Procedure.SeriesOfPredicateViolations p c
axiom corr225_proc_receipts {p : Person} {ce : Elements.CrimesEnterprise} {c : ComplaintText} :
    Elements.GrossReceiptsAtLeast5M p ce c → Procedure.ReceiptsThresholdWithinTwentyFourMonths p c

theorem s225_elements_implies_procedure {party : Person} {ce : Elements.CrimesEnterprise}
    {c : ComplaintText}
    (h : Elements.Section225 party ce c) : Procedure.ContinuingEnterpriseAccumulation party c :=
  ⟨corr225_proc_series h.enterprise.series, corr225_proc_receipts h.receipts⟩

axiom corr225_dp_series {p : Person} {c : ComplaintText} :
    Deontic.OrganizedContinuingFinancialCrimesEnterprise225 p c → Procedure.SeriesOfPredicateViolations p c
axiom corr225_dp_receipts {p : Person} {c : ComplaintText} :
    Deontic.ReceivedFiveMillionOver24Months225 p c → Procedure.ReceiptsThresholdWithinTwentyFourMonths p c

theorem s225_deontic_implies_procedure {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated225 p c) : Procedure.ContinuingEnterpriseAccumulation p c :=
  ⟨corr225_dp_series h.2, corr225_dp_receipts h.1.condition⟩

def s225_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {ce : Elements.CrimesEnterprise} {c : ComplaintText},
      Elements.Section225 party ce c → Deontic.ProhibitionViolated225 party c)
  ∧ (∀ {party : Person} {ce : Elements.CrimesEnterprise} {c : ComplaintText},
      Elements.Section225 party ce c → Procedure.ContinuingEnterpriseAccumulation party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated225 p c → Procedure.ContinuingEnterpriseAccumulation p c)

theorem s225_tierA : s225_tierA_pairwise_discharge :=
  ⟨fun h => s225_elements_implies_deontic h,
   fun h => s225_elements_implies_procedure h,
   fun h => s225_deontic_implies_procedure h⟩



axiom corr226_addr {p : Person} {tov : Elements.ThingOfValue} {c : ComplaintText} :
    Elements.ConfersThingOfValue p tov c → Deontic.AddresseeAnyPerson p c
axiom corr226_cond {p : Person} {c : ComplaintText} :
    Elements.IntentToCommitTerrorismAffectingSeaport p c → Deontic.TerrorismPurposeAffectingSeaport226 p c
axiom corr226_act {p : Person} {tov : Elements.ThingOfValue} {c : ComplaintText} :
    Elements.ConfersThingOfValue p tov c → Elements.ActsCorruptly p c →
    Deontic.KnowinglyCorruptBriberyAffectingPortSecurity226 p c

theorem s226_elements_implies_deontic {giver : Person} {tov : Elements.ThingOfValue}
    {c : ComplaintText}
    (h : Elements.Section226Give giver tov c) : Deontic.ProhibitionViolated226 giver c :=
  ⟨⟨corr226_addr h.confers, corr226_cond h.intent⟩, corr226_act h.confers h.corrupt⟩

axiom corr226_sc_corrupt {p : Person} {c : ComplaintText} :
    Elements.ActsCorruptly p c → Scienter.ActedCorruptly p c
axiom corr226_sc_met {p : Person} {c : ComplaintText} :
    Elements.KnowinglyAndWillfully p c → Scienter.ScienterMet Scienter.RequiredMentalState226 p c
axiom corr226_sc_terror {p : Person} {c : ComplaintText} :
    Elements.IntentToCommitTerrorismAffectingSeaport p c → Scienter.IntentToCommitTerrorismViaBribery p c

theorem s226_elements_implies_scienter {giver : Person} {tov : Elements.ThingOfValue}
    {c : ComplaintText}
    (h : Elements.Section226Give giver tov c) : Scienter.Culpable226 giver c :=
  ⟨corr226_sc_corrupt h.corrupt, corr226_sc_met h.knowingly, Or.inl (corr226_sc_terror h.intent)⟩

axiom corr226_ds_corrupt {p : Person} {c : ComplaintText} :
    Deontic.KnowinglyCorruptBriberyAffectingPortSecurity226 p c → Scienter.ActedCorruptly p c
axiom corr226_ds_met {p : Person} {c : ComplaintText} :
    Deontic.KnowinglyCorruptBriberyAffectingPortSecurity226 p c →
    Scienter.ScienterMet Scienter.RequiredMentalState226 p c
axiom corr226_ds_terror {p : Person} {c : ComplaintText} :
    Deontic.TerrorismPurposeAffectingSeaport226 p c → Scienter.IntentToCommitTerrorismViaBribery p c

theorem s226_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated226 p c) : Scienter.Culpable226 p c :=
  ⟨corr226_ds_corrupt h.2, corr226_ds_met h.2, Or.inl (corr226_ds_terror h.1.condition)⟩

def s226_tierA_pairwise_discharge : Prop :=
  (∀ {giver : Person} {tov : Elements.ThingOfValue} {c : ComplaintText},
      Elements.Section226Give giver tov c → Deontic.ProhibitionViolated226 giver c)
  ∧ (∀ {giver : Person} {tov : Elements.ThingOfValue} {c : ComplaintText},
      Elements.Section226Give giver tov c → Scienter.Culpable226 giver c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated226 p c → Scienter.Culpable226 p c)

theorem s226_tierA : s226_tierA_pairwise_discharge :=
  ⟨fun h => s226_elements_implies_deontic h,
   fun h => s226_elements_implies_scienter h,
   fun h => s226_deontic_implies_scienter h⟩



axiom corr227_addr {p : Person} {c : ComplaintText} :
    Elements.IsCoveredGovernmentPerson p c → Deontic.AddresseeIsCoveredGovernmentPerson p c
axiom corr227_cond {p : Person} {ed : Elements.EmploymentDecision} {c : ComplaintText} :
    Elements.IntentToInfluenceEmploymentOnPartisanBasis p ed c → Deontic.PartisanPoliticalBasis227 p c
axiom corr227_act {p : Person} {c : ComplaintText} :
    Elements.TakesOrInfluencesOfficialAct p c → Deontic.UsedOfficialActToInfluencePrivateEmployment227 p c

theorem s227_elements_implies_deontic {party : Person} {ed : Elements.EmploymentDecision}
    {c : ComplaintText}
    (h : Elements.Section227 party ed c) : Deontic.ProhibitionViolated227 party c :=
  ⟨⟨corr227_addr h.covered, corr227_cond h.intent⟩, corr227_act h.act⟩

axiom corr227_sc {p : Person} {ed : Elements.EmploymentDecision} {c : ComplaintText} :
    Elements.IntentToInfluenceEmploymentOnPartisanBasis p ed c →
    Scienter.ScienterMet Scienter.RequiredMentalState227 p c

theorem s227_elements_implies_scienter {party : Person} {ed : Elements.EmploymentDecision}
    {c : ComplaintText}
    (h : Elements.Section227 party ed c) : Scienter.Culpable227 party c :=
  corr227_sc h.intent

axiom corr227_ds {p : Person} {c : ComplaintText} :
    Deontic.PartisanPoliticalBasis227 p c → Scienter.ScienterMet Scienter.RequiredMentalState227 p c

theorem s227_deontic_implies_scienter {p : Person} {c : ComplaintText}
    (h : Deontic.ProhibitionViolated227 p c) : Scienter.Culpable227 p c :=
  corr227_ds h.1.condition

def s227_tierA_pairwise_discharge : Prop :=
  (∀ {party : Person} {ed : Elements.EmploymentDecision} {c : ComplaintText},
      Elements.Section227 party ed c → Deontic.ProhibitionViolated227 party c)
  ∧ (∀ {party : Person} {ed : Elements.EmploymentDecision} {c : ComplaintText},
      Elements.Section227 party ed c → Scienter.Culpable227 party c)
  ∧ (∀ {p : Person} {c : ComplaintText},
      Deontic.ProhibitionViolated227 p c → Scienter.Culpable227 p c)

theorem s227_tierA : s227_tierA_pairwise_discharge :=
  ⟨fun h => s227_elements_implies_deontic h,
   fun h => s227_elements_implies_scienter h,
   fun h => s227_deontic_implies_scienter h⟩












axiom mapComplaint : ComplaintText → Proving.Rico.ComplaintText

axiom bribeActOf201 {giver recipient : Person} {tov : Elements.ThingOfValue}
    {oa : Elements.OfficialAct} {c : ComplaintText} :
    Elements.Section201b1 giver recipient tov oa c → Proving.Rico.Act
axiom corr_201_isRacketeering {giver recipient : Person} {tov : Elements.ThingOfValue}
    {oa : Elements.OfficialAct} {c : ComplaintText} (h : Elements.Section201b1 giver recipient tov oa c) :
    Proving.Rico.IsRacketeeringActivity (bribeActOf201 h) (mapComplaint c)



theorem s201_elements_implies_golden {giver recipient : Person} {tov : Elements.ThingOfValue}
    {oa : Elements.OfficialAct} {c : ComplaintText}
    (h : Elements.Section201b1 giver recipient tov oa c) :
    Proving.Rico.IsRacketeeringActivity (bribeActOf201 h) (mapComplaint c) :=
  corr_201_isRacketeering h

axiom bribeActOf224 {party : Person} {sc : Elements.BriberyScheme}
    {target : Elements.SportingContest} {c : ComplaintText} :
    Elements.Section224 party sc target c → Proving.Rico.Act
axiom corr_224_isRacketeering {party : Person} {sc : Elements.BriberyScheme}
    {target : Elements.SportingContest} {c : ComplaintText} (h : Elements.Section224 party sc target c) :
    Proving.Rico.IsRacketeeringActivity (bribeActOf224 h) (mapComplaint c)



theorem s224_elements_implies_golden {party : Person} {sc : Elements.BriberyScheme}
    {target : Elements.SportingContest} {c : ComplaintText}
    (h : Elements.Section224 party sc target c) :
    Proving.Rico.IsRacketeeringActivity (bribeActOf224 h) (mapComplaint c) :=
  corr_224_isRacketeering h











axiom corr204_addr {p : Person} {c : ComplaintText} :
    Elements.IsMemberOfCongress p c → Deontic.AddresseeIsMemberOfCongress p c
axiom corr204_act {p : Person} {c : ComplaintText} :
    Elements.PracticesInRestrictedCourt p c → Deontic.PracticedBeforeFederalClaimsOrCircuitCourt204 p c
theorem s204_elements_implies_deontic {party : Person} {c : ComplaintText}
    (h : Elements.Section204 party c) : Deontic.ProhibitionViolated204 party c :=
  ⟨⟨corr204_addr h.member⟩, corr204_act h.practices⟩

axiom corr205_addr {p : Person} {c : ComplaintText} :
    Elements.IsOfficerOrEmployeeOfUS p c → Deontic.AddresseeIsFederalOfficerOrEmployee p c
axiom corr205_cond {pm : Elements.ParticularMatter} {c : ComplaintText} :
    Elements.MatterInWhichUSHasInterest pm c → Deontic.CoveredMatterUSInterest205 c
axiom corr205_act {p : Person} {claim : Elements.Claim} {pm : Elements.ParticularMatter}
    {c : ComplaintText} :
    (Elements.ProsecutesClaimAgainstUS p claim c ∨ Elements.ActsAsAgentOrAttorney p pm c) →
    Deontic.ActedAsAgentOrAttorneyAgainstUS205 p c
theorem s205_elements_implies_deontic {party : Person} {claim : Elements.Claim}
    {pm : Elements.ParticularMatter} {c : ComplaintText}
    (h : Elements.Section205a party claim pm c) : Deontic.ProhibitionViolated205 party c :=
  ⟨⟨corr205_addr h.officer, corr205_cond h.matter⟩, corr205_act h.act⟩

axiom corr209_addr {p : Person} {c : ComplaintText} :
    Elements.IsOfficerOrEmployeeOfUS p c → Deontic.AddresseeIsFederalOfficerOrEmployee p c
axiom corr209_act {p : Person} {ss : Elements.SalarySupplementation} {c : ComplaintText} :
    Elements.ReceivesOutsideSalarySupplementation p ss c → Deontic.ReceivedSalaryFromNonUSSource209 p c
theorem s209_elements_implies_deontic {party : Person} {ss : Elements.SalarySupplementation}
    {c : ComplaintText}
    (h : Elements.Section209a party ss c) : Deontic.ProhibitionViolated209 party c :=
  ⟨⟨corr209_addr h.officer⟩, corr209_act h.receives⟩

axiom corr211_addr {p : Person} {office : Elements.AppointiveOffice} {c : ComplaintText} :
    Elements.SolicitsValueForAppointiveOfficeInfluence p office c → Deontic.AddresseeAnyPerson p c
axiom corr211_act {p : Person} {office : Elements.AppointiveOffice} {c : ComplaintText} :
    Elements.SolicitsValueForAppointiveOfficeInfluence p office c →
    Deontic.SolicitedValueToObtainAppointiveOffice211 p c
theorem s211_elements_implies_deontic {party : Person} {office : Elements.AppointiveOffice}
    {c : ComplaintText}
    (h : Elements.Section211 party office c) : Deontic.ProhibitionViolated211 party c :=
  ⟨⟨corr211_addr h.solicits⟩, corr211_act h.solicits⟩

axiom corr212_addr {p : Person} {fi : Elements.FinancialInstitution} {c : ComplaintText} :
    Elements.IsFinancialInstitutionInsider p fi c → Deontic.AddresseeIsFinancialInstitutionInsider p c
axiom corr212_act {p : Person} {lg : Elements.LoanOrGratuity} {c : ComplaintText} :
    Elements.GivesLoanOrGratuityToExaminer p lg c → Deontic.MadeLoanOrGratuityToExaminer212 p c
theorem s212_elements_implies_deontic {party : Person} {fi : Elements.FinancialInstitution}
    {lg : Elements.LoanOrGratuity} {c : ComplaintText}
    (h : Elements.Section212 party fi lg c) : Deontic.ProhibitionViolated212 party c :=
  ⟨⟨corr212_addr h.insider⟩, corr212_act h.gives⟩

axiom corr213_addr {p : Person} {c : ComplaintText} :
    Elements.IsExaminer p c → Deontic.AddresseeIsFinancialInstitutionExaminer p c
axiom corr213_act {p : Person} {lg : Elements.LoanOrGratuity} {c : ComplaintText} :
    Elements.ExaminerAcceptsLoanOrGratuity p lg c → Deontic.AcceptedLoanOrGratuityWhileExaminer213 p c
theorem s213_elements_implies_deontic {party : Person} {lg : Elements.LoanOrGratuity}
    {c : ComplaintText}
    (h : Elements.Section213 party lg c) : Deontic.ProhibitionViolated213 party c :=
  ⟨⟨corr213_addr h.examiner⟩, corr213_act h.accepts⟩

axiom corr214_addr {p : Person} {fee : Elements.FeeOrCommission} {c : ComplaintText} :
    Elements.GivesOrReceivesFeeForFedReserveProcurement p fee c → Deontic.AddresseeAnyPerson p c
axiom corr214_cond {fee : Elements.FeeOrCommission} {c : ComplaintText} :
    (¬ Elements.DisclosedInWriting fee c) → Deontic.FeeNotDisclosedInWriting214 c
axiom corr214_act {p : Person} {fee : Elements.FeeOrCommission} {c : ComplaintText} :
    Elements.GivesOrReceivesFeeForFedReserveProcurement p fee c →
    Deontic.TookFeeForProcuringFederalReserveLoan214 p c
theorem s214_elements_implies_deontic {party : Person} {fee : Elements.FeeOrCommission}
    {c : ComplaintText}
    (h : Elements.Section214 party fee c) : Deontic.ProhibitionViolated214 party c :=
  ⟨⟨corr214_addr h.procures, corr214_cond h.notDisclosed⟩, corr214_act h.procures⟩

axiom corr217_addr {p : Person} {c : ComplaintText} :
    Elements.IsOfficerOrEmployeeOfUS p c → Deontic.AddresseeIsFederalOfficerOrEmployee p c
axiom corr217_act {p : Person} {c : ComplaintText} :
    Elements.AcceptsConsiderationForFarmIndebtedness p c →
    Deontic.AcceptedConsiderationForFarmDebtAdjustment217 p c
theorem s217_elements_implies_deontic {party : Person} {c : ComplaintText}
    (h : Elements.Section217 party c) : Deontic.ProhibitionViolated217 party c :=
  ⟨⟨corr217_addr h.officer⟩, corr217_act h.accepts⟩

axiom corr219_addr {p : Person} {c : ComplaintText} :
    Elements.IsPublicOfficial p c → Deontic.AddresseeIsPublicOfficial p c
axiom corr219_act {p : Person} {c : ComplaintText} :
    Elements.ActsAsAgentOfForeignPrincipal p c → Deontic.ActedAsUnregisteredForeignAgent219 p c
theorem s219_elements_implies_deontic {party : Person} {c : ComplaintText}
    (h : Elements.Section219 party c) : Deontic.ProhibitionViolated219 party c :=
  ⟨⟨corr219_addr h.official⟩, corr219_act h.foreignAgent⟩

end Proving.USC.T18.Ch11.Reslice.Bridge
