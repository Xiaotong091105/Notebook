
set nocount on
set ansi_warnings off
set dateformat dmy

/**************************************************************************************************************
#LocalTumourSiteMapping

select * from #LocalTumourSiteMapping where TumourSite = 'Breast'
select Code from #LocalTumourSiteMapping group by Code having count(*)>1
**************************************************************************************************************/
if object_id('tempdb.dbo.#LocalTumourSiteMapping') is not null drop table #LocalTumourSiteMapping
begin

create table #LocalTumourSiteMapping (
									--Code varchar(4)
									--,DiagnosisDescription varchar(200)
									--,PrimaryCancer varchar(1)
									--,TumourSite varchar (50)

									Code varchar(4)
									,DiagnosisDescription varchar(200)
									,PrimaryCancer varchar(1)
									,TumourSite varchar(50)
									,HaemOnc varchar(50)
									,Malignancy varchar(50)
									)

insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C000','Malignant neoplasm: External upper lip','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C001','Malignant neoplasm: External lower lip','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C002','Malignant neoplasm: External lip, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C003','Malignant neoplasm: Upper lip, inner aspect','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C004','Malignant neoplasm: Lower lip, inner aspect','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C005','Malignant neoplasm: Lip, unspecified, inner aspect','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C006','Malignant neoplasm: Commissure of lip','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C008','Malignant neoplasm: Overlapping lesion of lip','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C009','Malignant neoplasm: Lip, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C01X','Malignant neoplasm of base of tongue','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C020','Malignant neoplasm: Dorsal surface of tongue','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C021','Malignant neoplasm: Border of tongue','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C022','Malignant neoplasm: Ventral surface of tongue','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C023','Malignant neoplasm: Anterior two-thirds of tongue, part unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C024','Malignant neoplasm: Lingual tonsil','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C028','Malignant neoplasm: Overlapping lesion of tongue','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C029','Malignant neoplasm: Tongue, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C030','Malignant neoplasm: Upper gum','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C031','Malignant neoplasm: Lower gum','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C039','Malignant neoplasm: Gum, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C040','Malignant neoplasm: Anterior floor of mouth','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C041','Malignant neoplasm: Lateral floor of mouth','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C048','Malignant neoplasm: Overlapping lesion of floor of mouth','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C049','Malignant neoplasm: Floor of mouth, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C050','Malignant neoplasm: Hard palate','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C051','Malignant neoplasm: Soft palate','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C052','Malignant neoplasm: Uvula','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C058','Malignant neoplasm: Overlapping lesion of palate','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C059','Malignant neoplasm: Palate, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C060','Malignant neoplasm: Cheek mucosa','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C061','Malignant neoplasm: Vestibule of mouth','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C062','Malignant neoplasm: Retromolar area','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C068','Malignant neoplasm: Overlapping lesion of other and unspecified parts of mouth','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C069','Malignant neoplasm: Mouth, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C07X','Malignant neoplasm of parotid gland','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C080','Malignant neoplasm: Submandibular gland','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C081','Malignant neoplasm: Sublingual gland','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C088','Malignant neoplasm: Overlapping lesion of major salivary glands','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C089','Malignant neoplasm: Major salivary gland, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C090','Malignant neoplasm: Tonsillar fossa','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C091','Malignant neoplasm: Tonsillar pillar (anterior)(posterior)','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C098','Malignant neoplasm: Overlapping lesion of tonsil','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C099','Malignant neoplasm: Tonsil, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C100','Malignant neoplasm: Vallecula','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C101','Malignant neoplasm: Anterior surface of epiglottis','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C102','Malignant neoplasm: Lateral wall of oropharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C103','Malignant neoplasm: Posterior wall of oropharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C104','Malignant neoplasm: Branchial cleft','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C108','Malignant neoplasm: Overlapping lesion of oropharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C109','Malignant neoplasm: Oropharynx, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C110','Malignant neoplasm: Superior wall of nasopharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C111','Malignant neoplasm: Posterior wall of nasopharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C112','Malignant neoplasm: Lateral wall of nasopharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C113','Malignant neoplasm: Anterior wall of nasopharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C118','Malignant neoplasm: Overlapping lesion of nasopharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C119','Malignant neoplasm: Nasopharynx, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C12X','Malignant neoplasm of piriform sinus','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C130','Malignant neoplasm: Postcricoid region','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C131','Malignant neoplasm: Aryepiglottic fold, hypopharyngeal aspect','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C132','Malignant neoplasm: Posterior wall of hypopharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C138','Malignant neoplasm: Overlapping lesion of hypopharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C139','Malignant neoplasm: Hypopharynx, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C140','Malignant neoplasm: Pharynx, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C142','Malignant neoplasm: Waldeyer ring','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C148','Malignant neoplasm: Overlapping lesion of lip, oral cavity and pharynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C150','Malignant neoplasm: Cervical part of oesophagus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C151','Malignant neoplasm: Thoracic part of oesophagus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C152','Malignant neoplasm: Abdominal part of oesophagus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C153','Malignant neoplasm: Upper third of oesophagus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C154','Malignant neoplasm: Middle third of oesophagus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C155','Malignant neoplasm: Lower third of oesophagus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C158','Malignant neoplasm: Overlapping lesion of oesophagus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C159','Malignant neoplasm: Oesophagus, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C160','Malignant neoplasm: Cardia','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C161','Malignant neoplasm: Fundus of stomach','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C162','Malignant neoplasm: Body of stomach','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C163','Malignant neoplasm: Pyloric antrum','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C164','Malignant neoplasm: Pylorus','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C165','Malignant neoplasm: Lesser curvature of stomach, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C166','Malignant neoplasm: Greater curvature of stomach, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C168','Malignant neoplasm: Overlapping lesion of stomach','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C169','Malignant neoplasm: Stomach, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C170','Malignant neoplasm: Duodenum','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C171','Malignant neoplasm: Jejunum','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C172','Malignant neoplasm: Ileum','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C173','Malignant neoplasm: Meckel diverticulum','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C178','Malignant neoplasm: Overlapping lesion of small intestine','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C179','Malignant neoplasm: Small intestine, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C180','Malignant neoplasm: Caecum','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C181','Malignant neoplasm: Appendix','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C182','Malignant neoplasm: Ascending colon','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C183','Malignant neoplasm: Hepatic flexure','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C184','Malignant neoplasm: Transverse colon','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C185','Malignant neoplasm: Splenic flexure','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C186','Malignant neoplasm: Descending colon','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C187','Malignant neoplasm: Sigmoid colon','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C188','Malignant neoplasm: Overlapping lesion of colon','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C189','Malignant neoplasm: Colon, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C19X','Malignant neoplasm of rectosigmoid junction','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C20X','Malignant neoplasm of rectum','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C210','Malignant neoplasm: Anus, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C211','Malignant neoplasm: Anal canal','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C212','Malignant neoplasm: Cloacogenic zone','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C218','Malignant neoplasm: Overlapping lesion of rectum, anus and anal canal','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C220','Malignant neoplasm: Liver cell carcinoma','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C221','Malignant neoplasm: Intrahepatic bile duct carcinoma','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C222','Malignant neoplasm: Hepatoblastoma','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C223','Malignant neoplasm: Angiosarcoma of liver','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C224','Malignant neoplasm: Other sarcomas of liver','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C227','Malignant neoplasm: Other specified carcinomas of liver','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C229','Malignant neoplasm: Liver, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C23X','Malignant neoplasm of gallbladder','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C240','Malignant neoplasm: Extrahepatic bile duct','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C241','Malignant neoplasm: Ampulla of Vater','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C248','Malignant neoplasm: Overlapping lesion of biliary tract','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C249','Malignant neoplasm: Biliary tract, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C250','Malignant neoplasm: Head of pancreas','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C251','Malignant neoplasm: Body of pancreas','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C252','Malignant neoplasm: Tail of pancreas','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C253','Malignant neoplasm: Pancreatic duct','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C254','Malignant neoplasm: Endocrine pancreas','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C257','Malignant neoplasm: Other parts of pancreas','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C258','Malignant neoplasm: Overlapping lesion of pancreas','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C259','Malignant neoplasm: Pancreas, unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C260','Malignant neoplasm: Intestinal tract, part unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C261','Malignant neoplasm: Spleen','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C268','Malignant neoplasm: Overlapping lesion of digestive system','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C269','Malignant neoplasm: Ill-defined sites within the digestive system','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C300','Malignant neoplasm: Nasal cavity','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C301','Malignant neoplasm: Middle ear','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C310','Malignant neoplasm: Maxillary sinus','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C311','Malignant neoplasm: Ethmoidal sinus','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C312','Malignant neoplasm: Frontal sinus','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C313','Malignant neoplasm: Sphenoidal sinus','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C318','Malignant neoplasm: Overlapping lesion of accessory sinuses','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C319','Malignant neoplasm: Accessory sinus, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C320','Malignant neoplasm: Glottis','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C321','Malignant neoplasm: Supraglottis','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C322','Malignant neoplasm: Subglottis','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C323','Malignant neoplasm: Laryngeal cartilage','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C328','Malignant neoplasm: Overlapping lesion of larynx','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C329','Malignant neoplasm: Larynx, unspecified','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C33X','Malignant neoplasm of trachea','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C340','Malignant neoplasm: Main bronchus','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C341','Malignant neoplasm: Upper lobe, bronchus or lung','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C342','Malignant neoplasm: Middle lobe, bronchus or lung','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C343','Malignant neoplasm: Lower lobe, bronchus or lung','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C348','Malignant neoplasm: Overlapping lesion of bronchus and lung','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C349','Malignant neoplasm: Bronchus or lung, unspecified','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C37X','Malignant neoplasm of thymus','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C380','Malignant neoplasm: Heart','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C381','Malignant neoplasm: Anterior mediastinum','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C382','Malignant neoplasm: Posterior mediastinum','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C383','Malignant neoplasm: Mediastinum, part unspecified','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C384','Malignant neoplasm: Pleura','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C388','Malignant neoplasm: Overlapping lesion of heart, mediastinum and pleura','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C390','Malignant neoplasm: Upper respiratory tract, part unspecified','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C398','Malignant neoplasm: Overlapping lesion of respiratory and intrathoracic organs','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C399','Malignant neoplasm: Ill-defined sites within the respiratory system','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C400','Malignant neoplasm: Scapula and long bones of upper limb','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C401','Malignant neoplasm: Short bones of upper limb','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C402','Malignant neoplasm: Long bones of lower limb','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C403','Malignant neoplasm: Short bones of lower limb','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C408','Malignant neoplasm: Overlapping lesion of bone and articular cartilage of limbs','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C409','Malignant neoplasm: Bone and articular cartilage of limb, unspecified','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C410','Malignant neoplasm: Bones of skull and face','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C411','Malignant neoplasm: Mandible','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C412','Malignant neoplasm: Vertebral column','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C413','Malignant neoplasm: Ribs, sternum and clavicle','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C414','Malignant neoplasm: Pelvic bones, sacrum and coccyx','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C418','Malignant neoplasm: Overlapping lesion of bone and articular cartilage','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C419','Malignant neoplasm: Bone and articular cartilage, unspecified','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C430','Malignant neoplasm: Malignant melanoma of lip','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C431','Malignant neoplasm: Malignant melanoma of eyelid, including canthus','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C432','Malignant neoplasm: Malignant melanoma of ear and external auricular canal','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C433','Malignant neoplasm: Malignant melanoma of other and unspecified parts of face','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C434','Malignant neoplasm: Malignant melanoma of scalp and neck','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C435','Malignant neoplasm: Malignant melanoma of trunk','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C436','Malignant neoplasm: Malignant melanoma of upper limb, including shoulder','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C437','Malignant neoplasm: Malignant melanoma of lower limb, including hip','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C438','Malignant neoplasm: Overlapping malignant melanoma of skin','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C439','Malignant neoplasm: Malignant melanoma of skin, unspecified','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C440','Malignant neoplasm: Skin of lip','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C441','Malignant neoplasm: Skin of eyelid, including canthus','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C442','Malignant neoplasm: Skin of ear and external auricular canal','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C443','Malignant neoplasm: Skin of other and unspecified parts of face','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C444','Malignant neoplasm: Skin of scalp and neck','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C445','Malignant neoplasm: Skin of trunk','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C446','Malignant neoplasm: Skin of upper limb, including shoulder','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C447','Malignant neoplasm: Skin of lower limb, including hip','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C448','Malignant neoplasm: Overlapping lesion of skin','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C449','Malignant neoplasm: Malignant neoplasm of skin, unspecified','Y','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C450','Mesothelioma of pleura','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C451','Mesothelioma of peritoneum','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C452','Mesothelioma of pericardium','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C457','Mesothelioma of other sites','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C459','Mesothelioma, unspecified','Y','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C460','Kaposi sarcoma of skin','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C461','Kaposi sarcoma of soft tissue','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C462','Kaposi sarcoma of palate','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C463','Kaposi sarcoma of lymph nodes','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C467','Kaposi sarcoma of other sites','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C468','Kaposi sarcoma of multiple organs','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C469','Kaposi sarcoma, unspecified','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C470','Malignant neoplasm: Peripheral nerves of head, face and neck','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C471','Malignant neoplasm: Peripheral nerves of upper limb, including shoulder','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C472','Malignant neoplasm: Peripheral nerves of lower limb, including hip','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C473','Malignant neoplasm: Peripheral nerves of thorax','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C474','Malignant neoplasm: Peripheral nerves of abdomen','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C475','Malignant neoplasm: Peripheral nerves of pelvis','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C476','Malignant neoplasm: Peripheral nerves of trunk, unspecified','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C478','Malignant neoplasm: Overlapping lesion of peripheral nerves and autonomic nervous system','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C479','Malignant neoplasm: Peripheral nerves and autonomic nervous system, unspecified','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C480','Malignant neoplasm: Retroperitoneum','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C481','Malignant neoplasm: Specified parts of peritoneum','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C482','Malignant neoplasm: Peritoneum, unspecified','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C488','Malignant neoplasm: Overlapping lesion of retroperitoneum and peritoneum','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C490','Malignant neoplasm: Connective and soft tissue of head, face and neck','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C491','Malignant neoplasm: Connective and soft tissue of upper limb, including shoulder','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C492','Malignant neoplasm: Connective and soft tissue of lower limb, including hip','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C493','Malignant neoplasm: Connective and soft tissue of thorax','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C494','Malignant neoplasm: Connective and soft tissue of abdomen','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C495','Malignant neoplasm: Connective and soft tissue of pelvis','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C496','Malignant neoplasm: Connective and soft tissue of trunk, unspecified','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C498','Malignant neoplasm: Overlapping lesion of connective and soft tissue','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C499','Malignant neoplasm: Connective and soft tissue, unspecified','Y','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C500','Malignant neoplasm: Nipple and areola','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C501','Malignant neoplasm: Central portion of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C502','Malignant neoplasm: Upper-inner quadrant of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C503','Malignant neoplasm: Lower-inner quadrant of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C504','Malignant neoplasm: Upper-outer quadrant of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C505','Malignant neoplasm: Lower-outer quadrant of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C506','Malignant neoplasm: Axillary tail of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C508','Malignant neoplasm: Overlapping lesion of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C509','Malignant neoplasm: Breast, unspecified','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C510','Malignant neoplasm: Labium majus','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C511','Malignant neoplasm: Labium minus','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C512','Malignant neoplasm: Clitoris','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C518','Malignant neoplasm: Overlapping lesion of vulva','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C519','Malignant neoplasm: Vulva, unspecified','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C52X','Malignant neoplasm of vagina','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C530','Malignant neoplasm: Endocervix','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C531','Malignant neoplasm: Exocervix','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C538','Malignant neoplasm: Overlapping lesion of cervix uteri','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C539','Malignant neoplasm: Cervix uteri, unspecified','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C540','Malignant neoplasm: Isthmus uteri','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C541','Malignant neoplasm: Endometrium','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C542','Malignant neoplasm: Myometrium','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C543','Malignant neoplasm: Fundus uteri','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C548','Malignant neoplasm: Overlapping lesion of corpus uteri','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C549','Malignant neoplasm: Corpus uteri, unspecified','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C55X','Malignant neoplasm of uterus, part unspecified','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C56X','Malignant neoplasm of ovary','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C570','Malignant neoplasm: Fallopian tube','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C571','Malignant neoplasm: Broad ligament','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C572','Malignant neoplasm: Round ligament','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C573','Malignant neoplasm: Parametrium','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C574','Malignant neoplasm: Uterine adnexa, unspecified','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C577','Malignant neoplasm: Other specified female genital organs','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C578','Malignant neoplasm: Overlapping lesion of female genital organs','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C579','Malignant neoplasm: Female genital organ, unspecified','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C58X','Malignant neoplasm of placenta','Y','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C600','Malignant neoplasm: Prepuce','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C601','Malignant neoplasm: Glans penis','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C602','Malignant neoplasm: Body of penis','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C608','Malignant neoplasm: Overlapping lesion of penis','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C609','Malignant neoplasm: Penis, unspecified','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C61X','Malignant neoplasm of prostate','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C620','Malignant neoplasm: Undescended testis','Y','Testicular','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C621','Malignant neoplasm: Descended testis','Y','Testicular','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C629','Malignant neoplasm: Testis, unspecified','Y','Testicular','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C630','Malignant neoplasm: Epididymis','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C631','Malignant neoplasm: Spermatic cord','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C632','Malignant neoplasm: Scrotum','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C637','Malignant neoplasm: Other specified male genital organs','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C638','Malignant neoplasm: Overlapping lesion of male genital organs','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C639','Malignant neoplasm: Male genital organ, unspecified','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C64X','Malignant neoplasm of kidney, except renal pelvis','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C65X','Malignant neoplasm of renal pelvis','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C66X','Malignant neoplasm of ureter','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C670','Malignant neoplasm: Trigone of bladder','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C671','Malignant neoplasm: Dome of bladder','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C672','Malignant neoplasm: Lateral wall of bladder','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C673','Malignant neoplasm: Anterior wall of bladder','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C674','Malignant neoplasm: Posterior wall of bladder','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C675','Malignant neoplasm: Bladder neck','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C676','Malignant neoplasm: Ureteric orifice','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C677','Malignant neoplasm: Urachus','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C678','Malignant neoplasm: Overlapping lesion of bladder','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C679','Malignant neoplasm: Bladder, unspecified','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C680','Malignant neoplasm: Urethra','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C681','Malignant neoplasm: Paraurethral gland','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C688','Malignant neoplasm: Overlapping lesion of urinary organs','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C689','Malignant neoplasm: Urinary organ, unspecified','Y','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C690','Malignant neoplasm: Conjunctiva','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C691','Malignant neoplasm: Cornea','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C692','Malignant neoplasm: Retina','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C693','Malignant neoplasm: Choroid','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C694','Malignant neoplasm: Ciliary body','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C695','Malignant neoplasm: Lacrimal gland and duct','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C696','Malignant neoplasm: Orbit','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C698','Malignant neoplasm: Overlapping lesion of eye and adnexa','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C699','Malignant neoplasm: Eye, unspecified','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C700','Malignant neoplasm: Cerebral meninges','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C701','Malignant neoplasm: Spinal meninges','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C709','Malignant neoplasm: Meninges, unspecified','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C710','Malignant neoplasm: Cerebrum, except lobes and ventricles','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C711','Malignant neoplasm: Frontal lobe','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C712','Malignant neoplasm: Temporal lobe','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C713','Malignant neoplasm: Parietal lobe','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C714','Malignant neoplasm: Occipital lobe','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C715','Malignant neoplasm: Cerebral ventricle','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C716','Malignant neoplasm: Cerebellum','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C717','Malignant neoplasm: Brain stem','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C718','Malignant neoplasm: Overlapping lesion of brain','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C719','Malignant neoplasm: Brain, unspecified','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C720','Malignant neoplasm: Spinal cord','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C721','Malignant neoplasm: Cauda equina','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C722','Malignant neoplasm: Olfactory nerve','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C723','Malignant neoplasm: Optic nerve','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C724','Malignant neoplasm: Acoustic nerve','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C725','Malignant neoplasm: Other and unspecified cranial nerves','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C728','Malignant neoplasm: Overlapping lesion of brain and other parts of central nervous system','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C729','Malignant neoplasm: Central nervous system, unspecified','Y','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C73X','Malignant neoplasm of thyroid gland','Y','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C740','Malignant neoplasm: Cortex of adrenal gland','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C741','Malignant neoplasm: Medulla of adrenal gland','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C749','Malignant neoplasm: Adrenal gland, unspecified','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C750','Malignant neoplasm: Parathyroid gland','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C751','Malignant neoplasm: Pituitary gland','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C752','Malignant neoplasm: Craniopharyngeal duct','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C753','Malignant neoplasm: Pineal gland','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C754','Malignant neoplasm: Carotid body','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C755','Malignant neoplasm: Aortic body and other paraganglia','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C758','Malignant neoplasm: Pluriglandular involvement, unspecified','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C759','Malignant neoplasm: Endocrine gland, unspecified','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C760','Malignant neoplasm of other and ill-defined sites: Head, face and neck','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C761','Malignant neoplasm of other and ill-defined sites: Thorax','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C762','Malignant neoplasm of other and ill-defined sites: Abdomen','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C763','Malignant neoplasm of other and ill-defined sites: Pelvis','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C764','Malignant neoplasm of other and ill-defined sites: Upper limb','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C765','Malignant neoplasm of other and ill-defined sites: Lower limb','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C767','Malignant neoplasm of other and ill-defined sites: Other ill-defined sites','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C768','Malignant neoplasm of other and ill-defined sites: Overlapping lesion of other and ill-defined sites','Y','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C770','Secondary and unspecified malignant neoplasm: Lymph nodes of head, face and neck','N','Head and Neck','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C771','Secondary and unspecified malignant neoplasm: Intrathoracic lymph nodes','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C772','Secondary and unspecified malignant neoplasm: Intra-abdominal lymph nodes','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C773','Secondary and unspecified malignant neoplasm: Axillary and upper limb lymph nodes','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C774','Secondary and unspecified malignant neoplasm: Inguinal and lower limb lymph nodes','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C775','Secondary and unspecified malignant neoplasm: Intrapelvic lymph nodes','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C778','Secondary and unspecified malignant neoplasm: Lymph nodes of multiple regions','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C779','Secondary and unspecified malignant neoplasm: Lymph node, unspecified','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C780','Secondary malignant neoplasm of lung','N','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C781','Secondary malignant neoplasm of mediastinum','N','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C782','Secondary malignant neoplasm of pleura','N','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C783','Secondary malignant neoplasm of other and unspecified respiratory organs','N','Lung','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C784','Secondary malignant neoplasm of small intestine','N','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C785','Secondary malignant neoplasm of large intestine and rectum','N','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C786','Secondary malignant neoplasm of retroperitoneum and peritoneum','N','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C787','Secondary malignant neoplasm of liver and intrahepatic bile duct','N','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C788','Secondary malignant neoplasm of other and unspecified digestive organs','N','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C790','Secondary malignant neoplasm of kidney and renal pelvis','N','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C791','Secondary malignant neoplasm of bladder and other and unspecified urinary organs','N','Urological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C792','Secondary malignant neoplasm of skin','N','Skin','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C793','Secondary malignant neoplasm of brain and cerebral meninges','N','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C794','Secondary malignant neoplasm of other and unspecified parts of nervous system','N','Brain','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C795','Secondary malignant neoplasm of bone and bone marrow','N','Sarcoma','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C796','Secondary malignant neoplasm of ovary','N','Gynaecological','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C797','Secondary malignant neoplasm of adrenal gland','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C798','Secondary malignant neoplasm of other specified sites','N','Other','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C799','Secondary malignant neoplasm, unspecified site','N','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C800','Malignant neoplasm, primary site unknown, so stated','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C809','Malignant neoplasm, primary site unspecified','Y','GI','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C810','Nodular lymphocyte predominant Hodgkin lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C811','Nodular sclerosis (classical) Hodgkin lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C812','Mixed cellularity (classical) Hodgkin lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C813','Lymphocyte depleted (classical) Hodgkin lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C814','Lymphocyte-rich (classical) Hodgkin lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C817','Other (classical) Hodgkin lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C819','Hodgkin lymphoma, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C820','Follicular lymphoma grade I','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C821','Follicular lymphoma grade II','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C822','Follicular lymphoma grade III, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C823','Follicular lymphoma grade IIIa','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C824','Follicular lymphoma grade IIIb','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C825','Diffuse follicle centre lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C826','Cutaneous follicle centre lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C827','Other types of follicular lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C829','Follicular lymphoma, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C830','Small cell B-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C831','Mantle cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C832','Diffuse non-Hodgkin mixed sml & lge cell (diffuse) lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C833','Diffuse large B-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C834','Diffuse non-Hodgkins immunoblastic (diffuse) lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C835','Lymphoblastic (diffuse) lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C836','Diffuse non-Hodgkins lymphoma undifferentiated (diffuse)','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C837','Burkitt lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C838','Other non-follicular lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C839','Non-follicular (diffuse) lymphoma, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C840','Mycosis fungoides','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C841','Sezary disease','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C842','Peripheral and cutaneous T-cell lymphomas, T-zone lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C843','Periph & cutan T-cell lymphomas, lymphoepithelioid lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C844','Peripheral T-cell lymphoma, not elsewhere classified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C845','Other mature T/NK-cell lymphomas','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C846','Anaplastic large cell lymphoma, ALK-positive','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C847','Anaplastic large cell lymphoma, ALK-negative','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C848','Cutaneous T-cell lymphoma, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C849','Mature T/NK-cell lymphoma, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C850','Oth & unspec types of non-Hodgkins lymphoma, lymphosarcoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C851','B-cell lymphoma, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C852','Mediastinal (thymic) large B-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C857','Other specified types of non-Hodgkin lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C859','Non-Hodgkin lymphoma, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C860','Extranodal NK/T-cell lymphoma, nasal type','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C861','Hepatosplenic T-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C862','Enteropathy-type (intestinal) T-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C863','Subcutaneous panniculitis-like T-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C864','Blastic NK-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C865','Angioimmunoblastic T-cell lymphoma','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C866','Primary cutaneous CD30-positive T-cell proliferations','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C880','Waldenstrom macroglobulinaemia','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C881','Alpha heavy chain disease','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C882','Other heavy chain disease','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C883','Immunoproliferative small intestinal disease','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C884','Extranodal marginal zone B-cell lymphoma of mucosa-associated lymphoid tissue [MALT-lymphoma]','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C887','Other malignant immunoproliferative diseases','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C889','Malignant immunoproliferative disease, unspecified','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C900','Multiple myeloma','Y','Myeloma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C901','Plasma cell leukaemia','Y','Myeloma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C902','Extramedullary plasmacytoma','Y','Myeloma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C903','Solitary plasmacytoma','Y','Myeloma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C910','Acute lymphoblastic leukaemia [ALL]','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C911','Chronic lymphocytic leukaemia of B-cell type','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C912','Subacute lymphocytic leukaemia','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C913','Prolymphocytic leukaemia of B-cell type','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C914','Hairy-cell leukaemia','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C915','Adult T-cell lymphoma/leukaemia [HTLV-1-associated]','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C916','Prolymphocytic leukaemia of T-cell type','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C917','Other lymphoid leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C918','Mature B-cell leukaemia Burkitt-type','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C919','Lymphoid leukaemia, unspecified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C920','Acute myeloblastic leukaemia [AML]','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C921','Chronic myeloid leukaemia [CML], BCR/ABL-positive','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C922','Atypical chronic myeloid leukaemia, BCR/ABL-negative','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C923','Myeloid sarcoma','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C924','Acute promyelocytic leukaemia [PML]','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C925','Acute myelomonocytic leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C926','Acute myeloid leukaemia with 11q23-abnormality','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C927','Other myeloid leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C928','Acute myeloid leukaemia with multilineage dysplasia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C929','Myeloid leukaemia, unspecified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C930','Acute monoblastic/monocytic leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C931','Chronic myelomonocytic leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C932','Subacute monocytic leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C933','Juvenile myelomonocytic leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C937','Other monocytic leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C939','Monocytic leukaemia, unspecified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C940','Acute erythroid leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C941','Chronic erythraemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C942','Acute megakaryoblastic leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C943','Mast cell leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C944','Acute panmyelosis with myelofibrosis','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C945','Acute myelofibrosis','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C946','Myelodysplastic and myeloproliferative disease, not elsewhere classified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C947','Other specified leukaemias','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C950','Acute leukaemia of unspecified cell type','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C951','Chronic leukaemia of unspecified cell type','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C952','Subacute leukaemia unsp cell type','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C957','Other leukaemia of unspecified cell type','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C959','Leukaemia, unspecified','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C960','Multifocal and multisystemic (disseminated) Langerhans-cell histiocytosis [Letterer-Siwe disease]','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C961','Malignant histiocytosis','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C962','Malignant mast cell tumour','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C963','True histiocyt lymphoma','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C964','Sarcoma of dendritic cells (accessory cells)','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C965','Multifocal and unisystemic Langerhans-cell histiocytosis','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C966','Unifocal Langerhans-cell histiocytosis','Y','Lymphoma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C967','Other specified malignant neoplasms of lymphoid, haematopoietic and related tissue','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C968','Histiocytic sarcoma','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C969','Malignant neoplasm of lymphoid, haematopoietic and related tissue, unspecified','Y','Other Haem Malig','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('C97X','Malignant neoplasms of independent (primary) multiple sites','Y','Other','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D050','Lobular carcinoma in situ','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D051','Intraductal carcinoma in situ','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D057','Other carcinoma in situ of breast','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D059','Carcinoma in situ of breast, unspecified','Y','Breast','Oncology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D45X','Polycythaemia vera','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D460','Refractory anaemia without ring sideroblasts, so stated','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D461','Refractory anaemia with ring sideroblasts','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D462','Refractory anaemia with excess of blasts [RAEB]','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D464','Refractory anaemia, unspecified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D465','Refractory anaemia with multi-lineage dysplasia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D466','Myelodysplastic syndrome with isolated del(5q) chromosomal abnormality','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D467','Other myelodysplastic syndromes','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D469','Myelodysplastic syndrome, unspecified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D470','Histiocytic and mast cell tumours of uncertain and unknown behaviour','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D471','Chronic myeloproliferative disease','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D472','Monoclonal gammopathy of undetermined significance (MGUS)','Y','Myeloma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D473','Essential (haemorrhagic) thrombocythaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D474','Osteomyelofibrosis','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D475','Chronic eosinophilic leukaemia [hypereosinophilic syndrome]','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D477','Other specified neoplasms of uncertain or unknown behaviour of lymphoid, haematopoietic and related tissue','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D479','Neoplasm of uncertain or unknown behaviour of lymphoid, haematopoietic and related tissue, unspecified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D560','Alpha thalassaemia','O','Red Cell','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D561','Beta thalassaemia','O','Red Cell','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D570','Sickle-cell anaemia with crisis','O','Red Cell','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D571','Sickle-cell anaemia without crisis','O','Red Cell','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D572','Double heterozygous sickling disorders','O','Red Cell','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D591','Other autoimmune haemolytic anaemias','O','H&T','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D593','Haemolytic-uraemic syndrome','O','H&T','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D594','Other nonautoimmune haemolytic anaemias','O','H&T','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D618','Other specified aplastic anaemias','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D619','Aplastic anaemia, unspecified','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D693','Idiopathic thrombocytopenic purpura','O','H&T','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D695','Secondary thrombocytopenia','O','H&T','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('D696','Thrombocytopenia, unspecified','O','H&T','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('E859','Amyloidosis, unspecified','N','Myeloma','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('M311','Thrombotic microangiopathy','O','H&T','Haematology','Non-Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('Z856','Personal history of leukaemia','Y','Leukaemia','Haematology','Malignant')
insert into #LocalTumourSiteMapping (Code,DiagnosisDescription,PrimaryCancer,TumourSite,HaemOnc,Malignancy) values ('Z857','Personal history of other malignant neoplasms of lymphoid, haematopoietic and related tissues','Y','Lymphoma','Haematology','Malignant')


create nonclustered index idx on #LocalTumourSiteMapping (Code)
end
/**************************************************************************************************************
#Associated_TreatmentPlans --- All treatments linked to the cohort DX_ID

select * from #Associated_TreatmentPlans where TREATMENT_PLAN_ID = 23450 order by TREATMENT_PLAN_ID
select DX_ID,TREATMENT_PLAN_ID from #Associated_TreatmentPlans group by DX_ID,TREATMENT_PLAN_ID having count(*)>1
**************************************************************************************************************/
if object_id('tempdb.dbo.#DX_ID') is not null drop table #DX_ID
begin

select		distinct
			dia.DX_ID
			,dia.DX_NAME as 'Diagnosis'
			,icd.LINE
			,cicd.*
into		#DX_ID
from		CLARITY_EDG			dia
left join	EDG_CURRENT_ICD10	icd		on dia.DX_ID = icd.DX_ID
left join	#LocalTumourSiteMapping       cicd    on cicd.Code = case	when len(icd.CODE) = 3 -------------------------- if 3 characters long
																			then concat(replace(icd.CODE,'.',''),'X') --- add X at the end
																	when charindex(',',icd.CODE) = 4 ---------------- if first ICD code is 3 characters long
																		then concat(left(icd.CODE,3),'X') ----------- add X at the end
																	else replace(left(icd.CODE,5),'.','') ----------- Else take the first part and remove the dot
																end --------------------------- ICD codes
where		cicd.Code is not null ------ only those in the temp table.
AND cicd.HaemOnc = 'Oncology'

end

/**************************************************************************************************************
#Associated_TreatmentPlans --- All treatments linked to the cohort DX_ID

select * from #Associated_TreatmentPlans where TREATMENT_PLAN_ID = 17400 order by TREATMENT_PLAN_ID
select DX_ID,TREATMENT_PLAN_ID from #Associated_TreatmentPlans group by DX_ID,TREATMENT_PLAN_ID having count(*)>1
**************************************************************************************************************/
if object_id('tempdb.dbo.#Associated_TreatmentPlans') is not null drop table #Associated_TreatmentPlans
begin
select		distinct
			tp.TREATMENT_PLAN_ID
			,dx.*
			,STG.STAGE_GROUP_SUMMARY as StageGroupSummary
			,STG.STAGE_DESCRIPTION as StageDescription
			,stg.HER2_STATUS_NAME [HER2Status]
			,stg.CLASSIFICATION_NAME [ClassificationName]
			,STg.STAGE_METHOD_NAME as StageMethodName
			,row_number() over (partition by TREATMENT_PLAN_ID
												order by case	when PrimaryCancer = 'Y' then 1
																when PrimaryCancer = 'N' then 2
																when PrimaryCancer = 'O' then 3
																end asc,
																STG.Contact_Date asc
												--		,dx.LINE asc
														) as 'Count'
into		#Associated_TreatmentPlans
from		#DX_ID dx
left join	ASSOCIATED_DX tp	on tp.SPECIFIC_DX_ID = dx.DX_ID
Left Join CLARITY_REPORT.dbo.PROBLEM_LIST pl				on tp.PROBLEM_LIST_ID = pl.PROBLEM_LIST_ID
Left Join CLARITY_REPORT.dbo.V_CANCER_STAGING stg			on pl.PROBLEM_LIST_ID = stg.PROBLEM_LIST_ID and stg.MOST_RECENT_CONTACT_YN = 'Y' 
--and stg.CLASSIFICATION_NAME = 'Final Pre-treatment Stage'
Where 1=1
and	tp.PROBLEM_LINKED_TO_PLAN_YN = 'Y' ---- linked to TreatmentPlan
end

--Select top 1000 * from CLARITY_REPORT.dbo.V_CANCER_STAGING 

--Select * from #Associated_TreatmentPlans --22816
/****************************************************************************************************************
#MedGroup - Grouping for meds which helps to identify Chemo drugs

select * from #MedGroup order by 3 desc, 2
select MEDICATION_ID from #MedGroup group by MEDICATION_ID having count(*)>1
****************************************************************************************************************/
DROP TABLE IF EXISTS #MedGroup
;with Med_groups_cte as
			(
			Select		med.MEDICATION_ID
						,med.[NAME] 'Medication'
						,Case When SUM(Case When g_100.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: Oncology Treatment'
						,Case When SUM(Case When g_101.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: Supportive Care'
						,Case When SUM(Case When g_102.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: Pre-medication'
						,Case When SUM(Case When g_103.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: Dual Verify'
						,Case When SUM(Case When g_104.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: IVIG'
						,Case When SUM(Case When g_105.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: Advance prep chemo'
						,Case When SUM(Case When g_106.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: Haematology Treatment'
						,Case When SUM(Case When g_107.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: Advance Prep Screening'
						,Case When SUM(Case When g_108.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: SACT reporting supplement'
						,Case When SUM(Case When g_109.[NAME] is not null then 1 Else 0 End) > 0 then 'Y' Else 'N' End 'MedGroup: IT Oncology Treatment'
			
						,Case When SUM(Case When ISNULL(g_100.[NAME],g_108.[NAME]) is not null then 1 Else 0 End) > 0 then 1 Else 0 End 'CohortMeds' -- 'Oncology Treatment'or'SACT reporting supplement'

			From		CLARITY_REPORT.dbo.CLARITY_MEDICATION med		
			Left Join	CLARITY_REPORT.dbo.ERX_GROUPER_ONE g			on g.MEDICATION_ID = med.MEDICATION_ID
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_100			on g.GROUP_ONE_C = g_100.GROUP_ONE_C and g_100.GROUP_ONE_C = 100 -- Oncology Treatment
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_101			on g.GROUP_ONE_C = g_101.GROUP_ONE_C and g_101.GROUP_ONE_C = 101 -- Supportive Care
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_102			on g.GROUP_ONE_C = g_102.GROUP_ONE_C and g_102.GROUP_ONE_C = 102 -- Pre-medication
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_103			on g.GROUP_ONE_C = g_103.GROUP_ONE_C and g_103.GROUP_ONE_C = 103 -- Dual Verify
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_104			on g.GROUP_ONE_C = g_104.GROUP_ONE_C and g_104.GROUP_ONE_C = 104 -- IVIG
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_105			on g.GROUP_ONE_C = g_105.GROUP_ONE_C and g_105.GROUP_ONE_C = 105 -- Advance prep chemo
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_106			on g.GROUP_ONE_C = g_106.GROUP_ONE_C and g_106.GROUP_ONE_C = 106 -- Haematology Treatment
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_107			on g.GROUP_ONE_C = g_107.GROUP_ONE_C and g_107.GROUP_ONE_C = 107 -- Advance Prep Screening
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_108			on g.GROUP_ONE_C = g_108.GROUP_ONE_C and g_108.GROUP_ONE_C = 108 -- SACT reporting supplement
			Left Join	CLARITY_REPORT.dbo.ZC_GROUP_ONE g_109			on g.GROUP_ONE_C = g_109.GROUP_ONE_C and g_109.GROUP_ONE_C = 109 -- IT Oncology Treatment
			Group By	med.MEDICATION_ID
						,med.[NAME] --as'Medication'
			)
Select		MEDICATION_ID
			,Medication
			,Case When CohortMeds = 1 then 'Y' else 'N' End 'ChemoDrug'
			,[MedGroup: Supportive Care] as 'SupportiveCareDrug'
Into		#MedGroup
From		Med_groups_cte


/****************************************************************************************************************
#DrugLevelDATA - All Med Orders linked to TreatmentPlan

select * from #DrugLevelDATA order by MedicationStartDate
****************************************************************************************************************/
DROP TABLE IF EXISTS #DrugLevelDATA
;with distinct_TPL_cte as
			(
			Select	Distinct 
					TREATMENT_PLAN_ID
			From	#Associated_TreatmentPlans
			)
Select		Distinct 
			ad.*
			,pt.PAT_MRN_ID as MRN
			,pt.PAT_NAME PatientName
			,pt.BIRTH_DATE as DateofBirth
			,pt.DEATH_DATE as DateofDeath
			,SX.Name  as Sex
			,pt.ZIP as PostCode
			,tt.[NAME] 'PlanType'
			,ed.EPISODE_DEF_NAME 'TreatmentEpisode'
			,tpl.TREATMENT_PLAN_NAME 'TreatmentPlan'
			, (CASE WHEN (MONTH(UPDT.UPDATED_ON_TM)) <= 3 THEN convert(varchar(4), YEAR(UPDT.UPDATED_ON_TM)-1) + '/' + convert(varchar(4), YEAR(UPDT.UPDATED_ON_TM)%100)
			ELSE convert(varchar(4),YEAR(UPDT.UPDATED_ON_TM))+ '/' + convert(varchar(4),(YEAR(UPDT.UPDATED_ON_TM)%100)+1)END)  as LatestUpdateFinYear
			,DD2.MONTH_BEGIN_DT as LatestUpdateMonth
			,UPDT.UPDATED_ON_TM LatestUpdateDateTime
			,UPDT.USER_NAME_EXT as LatestUpdateUser
			,ZCPS.NAME as TreatmentPlanStatus
			,tpl.IS_PLAN_DELETED_YN as IsPlanDeletedYN
			,ZCDR.NAME as DiscontinueTreatmentPlanReason
			,ZCPD.NAME as DiscontinuePathwayReason
			, (CASE WHEN (MONTH(TPL.DISCON_INSTANT_UTC_DTTM)) <= 3 THEN convert(varchar(4), YEAR(TPL.DISCON_INSTANT_UTC_DTTM)-1) + '/' + convert(varchar(4), YEAR(TPL.DISCON_INSTANT_UTC_DTTM)%100)
			ELSE convert(varchar(4),YEAR(TPL.DISCON_INSTANT_UTC_DTTM))+ '/' + convert(varchar(4),(YEAR(TPL.DISCON_INSTANT_UTC_DTTM)%100)+1)END)  as DiscontinueFinYear
			,DD3.MONTH_BEGIN_DT as DiscontinueMonth
			,tpl.DISCON_INSTANT_UTC_DTTM as DiscontinueDate
			,tpl.DISCON_COMMENT as DiscontinueComments
			,adj.[NAME] 'TreatmentGoal'
			,Case When tpl.TRT_GOAL_C in ('100000') then 'Curative'
			When tpl.TRT_GOAL_C in ('100001') then 'Maintenance'
			When tpl.TRT_GOAL_C in ('100002','100008','100009','100010') then 'Palliative'
			When tpl.TRT_GOAL_C in ('100003') then 'Support'
			When tpl.TRT_GOAL_C in ('100004') then 'Control'
			When tpl.TRT_GOAL_C in ('100005','100006') then 'Adjuvant'
			When tpl.TRT_GOAL_C in ('100007') then 'Disease Modification' Else adj.[NAME] End 'TreatmentGoalGrouped'
			,Case When adj.[NAME] = 'Adjuvant' then 'Yes' Else 'No' End [IsAdjuvantTreatment?]
			,ZCLOT.NAME as LineofTreatment
			,cyc.CYCLE_START_DATE 'CycleStartDate'
			,d.TX_STARTED_DTTM 'DayStartDate' -- Release Date
			,cyc.CYCLE_NUM 'CycleNumber'
			,d.TRT_DAY_NUM 'DayNumber'
			,mg.Medication
			,mg.ChemoDrug
			,mg.SupportiveCareDrug
			,ord.[START_DATE] 'MedicationStartDate'
			,ord.END_DATE 'MedicationEndDate'
			,mar.TAKEN_TIME 'AdministrationDate' -- [ORD 11030]
			,pv.ACTION_DTTM_LOCAL 'DispensedDate' -- [FRA 41]
			,isnull(mar.TAKEN_TIME,pv.ACTION_DTTM_LOCAL) 'MedDate' 
	
			,mar.MAR_ENC_CSN 'CSN_Administered'
			,otp.ENC_CSN 'CSN_OrderedFrom'
			,d.PAT_ENC_CSN_ID 'CSN_OrderReleased'
			,ph.PHARMACY_NAME 'PharmacyName'

			,os.[NAME] 'Status_Order'
			,TPL.PLAN_START_DATE as TreatmentPlanStartDate
			, (CASE WHEN (MONTH(TPL.PLAN_START_DATE)) <= 3 THEN convert(varchar(4), YEAR(TPL.PLAN_START_DATE)-1) + '/' + convert(varchar(4), YEAR(TPL.PLAN_START_DATE)%100)
			ELSE convert(varchar(4),YEAR(TPL.PLAN_START_DATE))+ '/' + convert(varchar(4),(YEAR(TPL.PLAN_START_DATE)%100)+1)END)  as TreatmentPlanStartFinYear
			,DD.MONTH_BEGIN_DT as TreatmentPlanStartMonth
			,ord.PAT_ID
			,otp.OTP_TRG_ID 'DAY_ID'
			,cyc.CYCLE_ID
			,mg.MEDICATION_ID
			,otp.ORDER_ID
			,otp.OTP_ID
			
Into		#DrugLevelDATA
From		distinct_TPL_cte dtp
Left Join	#Associated_TreatmentPlans ad				on dtp.TREATMENT_PLAN_ID = ad.TREATMENT_PLAN_ID -- Associated Diagnosis
			and ad.Count = 1
Left Join	CLARITY_REPORT.dbo.OTP_INFO otp				on dtp.TREATMENT_PLAN_ID = otp.OTP_TPL_ID -- Where the TP orders are kept
Left Join	CLARITY_REPORT.dbo.ORDER_MED ord			on otp.ORDER_ID = ord.ORDER_MED_ID -- Med Orders
Left Join	#MedGroup mg								on ord.MEDICATION_ID = mg.MEDICATION_ID -- Med group temp table created above
Left Join	CLARITY_REPORT.dbo.ZC_ORDER_STATUS os		on ord.ORDER_STATUS_C = os.ORDER_STATUS_C -- Order Status
														   
Left Join	CLARITY_REPORT.dbo.MAR_ADMIN_INFO mar		on ord.ORDER_MED_ID = mar.ORDER_MED_ID -- MAR
Left Join	CLARITY_REPORT.dbo.V_RX_AMB_ACTION pv		on ord.ORDER_MED_ID = pv.ORDER_MED_ID -- Pharmacy
														   
Left Join	CLARITY_REPORT.dbo.TPL_TXDAYS d				on otp.OTP_TRG_ID = d.TREATMENT_DAY_ID -- Treatment Day
Left Join	CLARITY_REPORT.dbo.TPL_INFO tpl				on d.TREATMENT_PLAN_ID = tpl.TREATMENT_PLAN_ID -- Treatment Plan
LEFT JOIN CLARITY_REPORT.dbo.ZC_LINE_OF_TREATMENT ZCLOT on ZCLOT.LINE_OF_TREATMENT_C = tpl.LINE_OF_TREATMENT_C
	LEFT JOIN (
		Select 
			TPLU.TREATMENT_PLAN_ID, 
			TPLU.UPDATED_ON_TM,
			EMP.USER_NAME_EXT ,
			ROW_NUMBER() OVER (PARTITION BY TPLU.TREATMENT_PLAN_ID ORDER BY UPDATED_ON_TM DESC) RN
		from 
			TPL_UPDATE_INFO TPLU
			LEFT JOIN CLARITY_EMP EMP
			ON TPLU.UPDATED_BY_USER_ID = EMP.USER_ID

			) UPDT
			ON UPDT.TREATMENT_PLAN_ID = TPL.TREATMENT_PLAN_ID
	AND UPDT.RN = '1'


LEFT JOIN 	CLARITY_REPORT.dbo.ZC_PLAN_STATUS ZCPS		on tpl.PLAN_STATUS_C = ZCPS.PLAN_STATUS_C
Left Join	CLARITY_REPORT.dbo.ZC_PLAN_REC_TYP tt		on tpl.PLAN_REC_TYP_C = tt.PLAN_REC_TYP_C -- Plan Type 
Left Join	CLARITY_REPORT.dbo.TPL_CYCLES cyc			on d.TREATMENT_PLAN_ID = cyc.TREATMENT_PLAN_ID -- Treatment Cycle
														and d.TRT_CYCLE = cyc.CYCLE_ID -- Cycle ID

Left Join	CLARITY_REPORT.dbo.HSB_TPL_LIST epl			on d.TREATMENT_PLAN_ID = epl.TPL_ID -- Link to get to Treatment Episode (Plans)
Left Join	CLARITY_REPORT.dbo.EPISODE ep				on epl.EPISODE_ID = ep.EPISODE_ID -- Treatment Episode
Left Join	CLARITY_REPORT.dbo.EPISODE_DEF ed			on ep.SUM_BLK_TYPE_ID = ed.EPISODE_DEF_ID -- Treatment Episode Name
														   
Left Join	CLARITY_REPORT.dbo.RX_PHR ph				on ph.PHARMACY_ID = isnull(pv.ACTION_PHARMACY_ID,ord.PHARMACY_ID) -- Pharmacy
														   
Left Join	CLARITY_REPORT.dbo.PATIENT pt				on ord.PAT_ID = pt.PAT_ID -- Patient
LEFT JOIN	CLARITY_REPORT.dbo.ZC_SEX SX				ON sx.RCPT_MEM_SEX_C = pt.SEX_C
Left Join	CLARITY_REPORT.dbo.VALID_PATIENT vpt		on ord.PAT_ID = vpt.PAT_ID -- Valid Patient Flag
Left Join	CLARITY_REPORT.dbo.PATIENT_3 tpt			on ord.PAT_ID = tpt.PAT_ID -- Test Patient Flag

Left Join	CLARITY_REPORT.dbo.ZC_TRT_GOAL adj			on tpl.TRT_GOAL_C = adj.TRT_GOAL_C -- adjuvant treatment
Left Join	CLARITY_REPORT.dbo.DATE_DIMENSION DD		ON CAST(TPL.PLAN_START_DATE as DATE) = CAST(DD.CALENDAR_DT as DATE) 
Left Join	CLARITY_REPORT.dbo.DATE_DIMENSION DD2		ON CAST(UPDT.UPDATED_ON_TM as DATE) = CAST(DD2.CALENDAR_DT as DATE) 
Left Join	CLARITY_REPORT.dbo.DATE_DIMENSION DD3		ON CAST(tpl.DISCON_INSTANT_UTC_DTTM  as DATE) = CAST(DD3.CALENDAR_DT as DATE) 

LEFT JOIN	CLARITY_REPORT.dbo.ZC_DC_REASON ZCDR		ON ZCDR.DC_REASON_C = TPL.DC_REASON_C 
LEFT JOIN	CLARITY_REPORT.dbo.ZC_PATHWAY_DISC_RE ZCPD	ON ZCPD.PATHWAY_DISC_RE_C = TPL.PATHWAY_DISC_RESN_C
LEFT JOIN	TRG_INFO TRG	on d.TREATMENT_DAY_ID = TRG.REGIMEN_ID
LEFT JOIN	ZC_DEFER_DAY_RSN DEF ON DEF.DEFER_DAY_RSN_C = TRG.DEFER_DAY_RSN_C
LEFT JOIN	ZC_OSQ_STATUS QST ON QST.OSQ_STATUS_C = TRG.TRG_STATUS_C
LEFT JOIN	ZC_TRT_DAY_STATUS ZCDS ON ZCDS.TRT_DAY_STATUS_C = d.TRT_DAY_STATUS_C

Where		1=1
			and ISNULL(tpt.IS_TEST_PAT_YN,'N') <> 'Y' -- Excluding Test Patient
			and ISNULL(vpt.IS_VALID_PAT_YN,'Y') <> 'N' -- Excluding Invalid pts
			--and mg.ChemoDrug = 'Y'
			and (mar.MAR_ACTION_C in (1,6) or pv.ACTION_TYPE_C = 80) -- Administered or Dispensed only
			and ed.EPISODE_DEF_NAME like 'SACT%' -- SACT Plans only
	--		and ISNULL(cyc.CYCLE_STATUS_C,1) <> 4 -- Excluding deleted Cycles
	--		and ISNULL(d.TRT_DAY_STATUS_C,3) not in (4,7,6,8) -- Excluding deleted & cancelled. Also Excluding Deferred & Given Externally as per Rakhe/Marriam
			--and CAST(ISNULL(mar.TAKEN_TIME,pv.ACTION_DTTM_LOCAL) as date) between '2023-03-01' and '2023-06-30' -- 3 months as requested

			--and mg.Medication like '%Talq%'

Order By	TREATMENT_PLAN_ID
			,CycleNumber
			,DayStartDate



DROP TABLE IF EXISTS #AdditionalDrugs

SELECT
	PT.PAT_MRN_ID,
	ord.ORDER_MED_ID,
	mg.MEDICATION_ID,
	mg.ROUTE,
	mg.FORM,
	mg.[NAME] 'Medication',
	ord.[START_DATE] 'MedicationStartDate',
	ord.END_DATE 'MedicationEndDate',
	FREQ.FREQ_NAME as Frequency,
	ord.MIN_DISCRETE_DOSE as OrderMinimumDiscreetDose,
	ord.MAX_DISCRETE_DOSE as OrderMaximumDiscreetDose,
	ZMUO.NAME as OrderDoseUnit,
	ORDi.NUMBER_OF_DOSES as NumberofDoses,
	mar.SIG as AdminDoseValue,
	ZMU.NAME as AdminDoseUnit,
	MLSIG_ORD_DOSE as MLSigOrderDose,
	MSIG.SIG_TEXT AS SIGText,
	mar.TAKEN_TIME 'AdministrationDate', -- [ORD 11030]
	pv.ACTION_DTTM_LOCAL 'DispensedDate' ,-- [FRA 41]
	isnull(mar.TAKEN_TIME,pv.ACTION_DTTM_LOCAL) 'MedDate' ,
	ps.TITLE as PharmaceuticalSubclass, 
	mar.MAR_ENC_CSN

INTO
	#AdditionalDrugs

FROM
---Left Join	
	CLARITY_REPORT.dbo.ORDER_MED ord			--on otp.ORDER_ID = ord.ORDER_MED_ID -- Med Orders
	LEFT JOIN	CLARITY_REPORT.dbo.ORDER_MEDINFO ORDi		on ord.ORDER_MED_ID = ORDi.ORDER_MED_ID
	Left Join	CLARITY_REPORT.dbo.CLARITY_MEDICATION mg	on ord.MEDICATION_ID = mg.MEDICATION_ID -- Med group temp table created above
	Left Join	CLARITY_REPORT.dbo.ZC_ORDER_STATUS os		on ord.ORDER_STATUS_C = os.ORDER_STATUS_C -- Order Status
	Left Join	CLARITY_REPORT.dbo.ZC_PHARM_SUBCLASS ps		on ps.PHARM_SUBCLASS_C = mg.PHARM_SUBCLASS_C	 												   
	Left Join	CLARITY_REPORT.dbo.MAR_ADMIN_INFO mar		on ord.ORDER_MED_ID = mar.ORDER_MED_ID -- MAR
	Left Join	CLARITY_REPORT.dbo.V_RX_AMB_ACTION pv		on ord.ORDER_MED_ID = pv.ORDER_MED_ID -- Pharmacy
	Left Join	CLARITY_REPORT.dbo.PATIENT pt				on ord.PAT_ID = pt.PAT_ID -- Patient													   
	LEFT JOIN 	CLARITY_REPORT.dbo.ZC_MED_UNIT ZMU			on ZMU.DISP_QTYUNIT_C = mar.DOSE_UNIT_C
	LEFT JOIN 	CLARITY_REPORT.dbo.ZC_MED_UNIT ZMUO			on ZMUO.DISP_QTYUNIT_C = ord.DOSE_UNIT_C
	LEFT JOIN CLARITY_REPORT.dbo.MLSIG_LEVEL_2 SIG			ON SIG.ORDER_ID = ord.ORDER_MED_ID
	LEFT JOIN ORDER_MED_SIG MSIG							on MSIG.ORDER_ID = ord.ORDER_MED_ID
	AND SIG.LINE = '1'
	LEFT JOIN CLARITY_REPORT.dbo.IP_FREQUENCY 	 FREQ
	ON FREQ.FREQ_ID = ORD.HV_DISCR_FREQ_ID
WHERE
	(mar.MAR_ACTION_C in (1,6) or pv.ACTION_TYPE_C = 80) -- Administered or Dispensed only
	--and CAST(ISNULL(mar.TAKEN_TIME,pv.ACTION_DTTM_LOCAL) as date) between '2023-03-01' and '2023-06-30' -- 3 months as requested
	AND(
	 mg.[NAME] like '%Prednisolone%'
	OR mg.[NAME] like '%Infliximab%'
	OR mg.[NAME] like '%budesonide%'
	OR mg.[NAME] like '%methylprednisolone%'
	OR mg.[NAME] like '%Vedolizumab%'
	OR mg.[NAME] like '%mycophenolate%mofetil%'
	OR mg.[NAME] like '%hydrocortisone%'
	OR mg.[NAME] like '%etanercept%'
	OR mg.[NAME] like '%tacrolimus%'
	OR mg.[NAME] like '%Abatacept%'
	OR mg.[NAME] like '%tocilizumab%'--
	OR (
	(mg.[NAME] like '%Hydrocortisone%'--
	OR mg.[NAME] like '%Alclometasone dipropionate%'--
	OR mg.[NAME] like '%Clobetasone butyrate%'--
	OR mg.[NAME] like '%Beclometasone dipropionate%'--
	OR mg.[NAME] like '%Betamethasone%'--
	OR mg.[NAME] like '%Fludroxycortide%'--
	OR mg.[NAME] like '%Fluocinolone acetonide%'--
	OR mg.[NAME] like '%Fluocinonide%'--
	OR mg.[NAME] like '%Fluticasone%'--
	OR mg.[NAME] like '%Mometasone furoate%'--
	OR mg.[NAME] like '%Clobetasol propionate%'--
	) and ( mg.FORM LIKE '%Topical%' OR mg.Route LIKE '%Topical%' )
	))

DROP TABLE IF EXISTS #AdditionalDrugsImmuno

SELECT
	PT.PAT_MRN_ID,
	ord.ORDER_MED_ID,
	mg.MEDICATION_ID,
	mg.ROUTE,
	mg.FORM,
	mg.[NAME] 'Medication',
	ord.[START_DATE] 'MedicationStartDate',
	ord.END_DATE 'MedicationEndDate',
	FREQ.FREQ_NAME as Frequency,
	ord.MIN_DISCRETE_DOSE as OrderMinimumDiscreetDose,
	ord.MAX_DISCRETE_DOSE as OrderMaximumDiscreetDose,
	ZMUO.NAME as OrderDoseUnit,
	ORDi.NUMBER_OF_DOSES as NumberofDoses,
	mar.SIG as AdminDoseValue,
	ZMU.NAME as AdminDoseUnit,
	MLSIG_ORD_DOSE as MLSigOrderDose,
	MSIG.SIG_TEXT AS SIGText,
	mar.TAKEN_TIME 'AdministrationDate', -- [ORD 11030]
	pv.ACTION_DTTM_LOCAL 'DispensedDate' ,-- [FRA 41]
	isnull(mar.TAKEN_TIME,pv.ACTION_DTTM_LOCAL) 'MedDate' ,
	ps.TITLE as PharmaceuticalSubclass, 
	mar.MAR_ENC_CSN

INTO
	#AdditionalDrugsImmuno

FROM
---Left Join	
	CLARITY_REPORT.dbo.ORDER_MED ord			--on otp.ORDER_ID = ord.ORDER_MED_ID -- Med Orders
	LEFT JOIN	CLARITY_REPORT.dbo.ORDER_MEDINFO ORDi		on ord.ORDER_MED_ID = ORDi.ORDER_MED_ID
	Left Join	CLARITY_REPORT.dbo.CLARITY_MEDICATION mg	on ord.MEDICATION_ID = mg.MEDICATION_ID -- Med group temp table created above
	Left Join	CLARITY_REPORT.dbo.ZC_ORDER_STATUS os		on ord.ORDER_STATUS_C = os.ORDER_STATUS_C -- Order Status
	Left Join	CLARITY_REPORT.dbo.ZC_PHARM_SUBCLASS ps		on ps.PHARM_SUBCLASS_C = mg.PHARM_SUBCLASS_C	 												   
	Left Join	CLARITY_REPORT.dbo.MAR_ADMIN_INFO mar		on ord.ORDER_MED_ID = mar.ORDER_MED_ID -- MAR
	Left Join	CLARITY_REPORT.dbo.V_RX_AMB_ACTION pv		on ord.ORDER_MED_ID = pv.ORDER_MED_ID -- Pharmacy
	Left Join	CLARITY_REPORT.dbo.PATIENT pt				on ord.PAT_ID = pt.PAT_ID -- Patient													   
	LEFT JOIN 	CLARITY_REPORT.dbo.ZC_MED_UNIT ZMU			on ZMU.DISP_QTYUNIT_C = mar.DOSE_UNIT_C
	LEFT JOIN 	CLARITY_REPORT.dbo.ZC_MED_UNIT ZMUO			on ZMUO.DISP_QTYUNIT_C = ord.DOSE_UNIT_C
	LEFT JOIN CLARITY_REPORT.dbo.MLSIG_LEVEL_2 SIG			ON SIG.ORDER_ID = ord.ORDER_MED_ID
	LEFT JOIN ORDER_MED_SIG MSIG							on MSIG.ORDER_ID = ord.ORDER_MED_ID
	AND SIG.LINE = '1'
	LEFT JOIN CLARITY_REPORT.dbo.IP_FREQUENCY 	 FREQ
	ON FREQ.FREQ_ID = ORD.HV_DISCR_FREQ_ID
WHERE
	(mar.MAR_ACTION_C in (1,6) or pv.ACTION_TYPE_C = 80) -- Administered or Dispensed only
	--and CAST(ISNULL(mar.TAKEN_TIME,pv.ACTION_DTTM_LOCAL) as date) between '2023-03-01' and '2023-06-30' -- 3 months as requested
	AND(
	 mg.NAME like '%Nivolumab%'
	OR  mg.NAME like '%Ipilimumab%'
	OR  mg.NAME like '%Pembrolizumab%'
	OR  mg.NAME like '%Atezolizumab%'
	OR  mg.NAME like '%Durvalumab%'
	OR  mg.NAME  like '%Cemiplimab%'
	OR  mg.NAME like '%Tremelimumab%'
	OR  mg.NAME like '%Avelumab%'
	OR  mg.NAME like '%Dostarlimab%'
	OR  mg.NAME like '%Relatlimab%'
	OR  mg.NAME like '%Botensilimab%'
	OR  mg.NAME like '%Balstilimab%'
	)


DROP TABLE IF EXISTS ##MedicationCourses


SELECT DISTINCT
	P.PAT_MRN_ID,
	D.TREATMENT_PLAN_ID as TreatmentPlanID,
	P.ORDER_MED_ID,
	P.Medication,
	P.PharmaceuticalSubclass,
	P.ROUTE as Route,
	P.OrderMinimumDiscreetDose,
	P.OrderMaximumDiscreetDose,
	P.Frequency,
	P.OrderDoseUnit,
	P.NumberofDoses,
	P.AdminDoseValue,
	P.AdminDoseUnit,
	P.MLSigOrderDose,
	P.SIGText,
	P.MedicationStartDate,
	P.MedicationEndDate
INTO 
	##MedicationCourses
	

FROM
	#AdditionalDrugs P
	Inner JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())
	
		AND(
	 P.Medication like '%Prednisolone%'--
	OR P.Medication like '%Infliximab%'--
	OR P.Medication like '%budesonide%' --
	OR P.Medication like '%methylprednisolone%'--
	OR P.Medication like '%Vedolizumab%'--
	OR P.Medication  like '%mycophenolate%mofetil%'--
	OR P.Medication like '%hydrocortisone%'--
	OR P.Medication like '%etanercept%'--
	OR P.Medication like '%tacrolimus%'--
	OR P.Medication like '%Abatacept%'--
	OR P.Medication like '%tocilizumab%'--

		OR (
	(P.Medication like '%Hydrocortisone%'--
	OR P.Medication like '%Alclometasone dipropionate%'--
	OR P.Medication like '%Clobetasone butyrate%'--
	OR P.Medication like '%Beclometasone dipropionate%'--
	OR P.Medication like '%Betamethasone%'--
	OR P.Medication like '%Fludroxycortide%'--
	OR P.Medication like '%Fluocinolone acetonide%'--
	OR P.Medication like '%Fluocinonide%'--
	OR P.Medication like '%Fluticasone%'--
	OR P.Medication like '%Mometasone furoate%'--
	OR P.Medication like '%Clobetasol propionate%'--
	) and ( p.FORM LIKE '%Topical%' OR p.Route LIKE '%Topical%' )
	))


DROP TABLE IF EXISTS ##MedicationCoursesImmuno


SELECT DISTINCT
	P.PAT_MRN_ID,
	P.ORDER_MED_ID,
	D.TREATMENT_PLAN_ID,
	D.TreatmentPlan,
	P.Medication,
	P.PharmaceuticalSubclass,
	P.ROUTE as Route,
	P.OrderMinimumDiscreetDose,
	P.OrderMaximumDiscreetDose,
	P.Frequency,
	P.OrderDoseUnit,
	P.NumberofDoses,
	P.AdminDoseValue,
	P.AdminDoseUnit,
	P.MLSigOrderDose,
	P.SIGText,
	P.MedicationStartDate,
	P.MedicationEndDate
INTO 
	##MedicationCoursesImmuno
	

FROM
	#AdditionalDrugsImmuno P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())
	AND(
	 P.Medication like '%Nivolumab%'
	OR P.Medication like '%Ipilimumab%'
	OR P.Medication like '%Pembrolizumab%'
	OR P.Medication like '%Atezolizumab%'
	OR P.Medication like '%Durvalumab%'
	OR P.Medication  like '%Cemiplimab%'
	OR P.Medication like '%Tremelimumab%'
	OR P.Medication like '%Avelumab%'
	OR P.Medication like '%Dostarlimab%'
	OR P.Medication like '%Relatlimab%'
	OR P.Medication like '%Botensilimab%'
	OR P.Medication like '%Balstilimab%'
)

DROP TABLE IF EXISTS #Prednisolone
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Prednisolone, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	--COUNT (DISTINCT ORDER_MED_ID) as  PantoprazoleMedicationCount,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestPrednisoloneDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestPrednisoloneDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#Prednisolone
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like '%Prednisolone%')




DROP TABLE IF EXISTS #Infliximab
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Infliximab, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	--COUNT (DISTINCT ORDER_MED_ID) as  PantoprazoleMedicationCount,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestInfliximabDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestInfliximabDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#Infliximab
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND (P.Medication like '%Infliximab%' )


DROP TABLE IF EXISTS #methylprednisolone
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Methylprednisolone, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestMethylprednisoloneDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestMethylprednisoloneDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#methylprednisolone
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND (P.Medication like '%methylprednisolone%' )

DROP TABLE IF EXISTS #Budesonide
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Budesonide, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestBudesonideDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestBudesonideDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#Budesonide
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like '%budesonide%')


DROP TABLE IF EXISTS #Vedolizumab
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Vedolizumab, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestVedolizumabDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestVedolizumabDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#Vedolizumab
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like '%Vedolizumab%')



DROP TABLE IF EXISTS #MMF 
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as MMF, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestMMFDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestMMFDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#MMF 
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like  '%mycophenolate%mofetil%')

	
	
DROP TABLE IF EXISTS #AB 
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Abatacept, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestAbataceptDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestAbataceptDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#AB 
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like  '%Abatacept%')


DROP TABLE IF EXISTS #HD 
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Hydrocortisone, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestHydrocortisoneDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestHydrocortisoneDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#HD 
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like  '%hydrocortisone%')


DROP TABLE IF EXISTS #ET 
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Etanercept, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestEtanerceptDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestEtanerceptDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#ET 
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like  '%etanercept%')


DROP TABLE IF EXISTS #TR 
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Tacrolimus, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestTacrolimusDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestTacrolimusDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#TR 
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like  '%tacrolimus%')

DROP TABLE IF EXISTS #Toc 
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as Tocilizumab, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestTocilizumabDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestTocilizumabDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#Toc 
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND ( P.Medication like  '%tocilizumab%')
	
DROP TABLE IF EXISTS #TOPICAL 
SELECT   DISTINCT
	P.PAT_MRN_ID,
	1 as TopicalSteroid, 
	P.ORDER_MED_ID as OrderMedID,
	P.MedDate,
	P.OrderMinimumDiscreetDose,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) = 1 THEN P.MedDate ELSE NULL END as EarliestTopicalSteroidDate,
	CASE WHEN ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) = 1 THEN P.MedDate ELSE NULL END as LatestTopicalSteroidDate,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate ASC) as EarliestRecord,
	ROW_NUMBER() OVER (PARTITION BY P.PAT_MRN_ID,D.TREATMENT_PLAN_ID ORDER BY P.MedDate DESC) as LatestRecord
INTO 
	#TOPICAL 
from 
	#AdditionalDrugs P
	LEFT JOIN #DrugLevelDATA D
	ON P.ORDER_MED_ID = D.ORDER_ID
	AND P.MedDate between D.TreatmentPlanStartDate and ISNULL(D.DiscontinueDate,GETDATE())

WHERE D.ORDER_ID is NULL
AND 
	((P.Medication like '%Hydrocortisone%'--
	OR P.Medication like '%Alclometasone dipropionate%'--
	OR P.Medication like '%Clobetasone butyrate%'--
	OR P.Medication like '%Beclometasone dipropionate%'--
	OR P.Medication like '%Betamethasone%'--
	OR P.Medication like '%Fludroxycortide%'--
	OR P.Medication like '%Fluocinolone acetonide%'--
	OR P.Medication like '%Fluocinonide%'--
	OR P.Medication like '%Fluticasone%'--
	OR P.Medication like '%Mometasone furoate%'--
	OR P.Medication like '%Clobetasol propionate%'--
	) and (p.FORM LIKE '%Topical%' OR p.Route LIKE '%Topical%' )
	)

/****************************************************************************************************************
How many patients were treated in total, regardless of diagnosis, with the following medicines in the 3 months between the start of June 2023 and end of August 2023?
 - Abemaciclib (Verzenios)
 - Alpelisib (Piqray)
 - Fulvestrant (fulvestrant or Faslodex)
 - Palbociclib (Ibrance)
 - Ribociclib (Kisqali)


****************************************************************************************************************/
DROP TABLE IF EXISTS #FOI
;with Nivolumab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%Nivolumab%'
			)
,Ipilimumab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%Ipilimumab%'
			)
,Pembrolizumab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%Pembrolizumab%'
			)
,Atezolizumab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%Atezolizumab%'
			)
,Durvalumab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%Durvalumab%'
			)
,cemiplimab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%cemiplimab%'
			)
,avelumab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%avelumab%'
			)
,TREMELIMUMAB_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%TREMELIMUMAB%'
			)
,Dostarlimab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%Dostarlimab%'
			)
,relatlimab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%relatlimab%'
			)
,Botensilimab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%botensilimab%'
			)
,Balstilimab_cte as
			(
			Select		Distinct
						TREATMENT_PLAN_ID
			From		#DrugLevelDATA
			Where		Medication like '%Balstilimab%'
			)

Select Distinct
dl.TREATMENT_PLAN_ID [TreatmentPlanID]
,dl.MRN
,dl.DateofBirth
,dl.DateofDeath
,dl.Sex
,dl.PostCode
,dl.StageGroupSummary
,dl.StageDescription
,dl.[HER2Status]
,dl.[ClassificationName]
,dl.StageMethodName
,dl.code as  ICD_CODE
,dl.HaemOnc
--,DL.LINE
,dl.DiagnosisDescription as Diagnosis
--,Dl.PROBLEM
,dl.TreatmentPlanStatus
,dl.IsPlanDeletedYN
,CASE WHEN CAST(dl.LatestUpdateDateTime as daTE) > DATEADD(Month,-3,CAST(GETDATE() AS DATE)) THEN 'Yes' ELSE 'No' end as Updatedinlast3Months
,dl.LatestUpdateFinYear
,dl.LatestUpdateMonth
,dl.LatestUpdateDateTime
,dl.LatestUpdateUser

,dl.PlanType
,dl.TreatmentEpisode
,dl.TreatmentPlan
,dl.TreatmentPlanStartFinYear
,dl.TreatmentPlanStartMonth
,Dl.TreatmentPlanStartDate
,Dl.DiscontinueTreatmentPlanReason
--,Dl.DiscontinuePathwayReason
,dl.DiscontinueFinYear
,dl.DiscontinueMonth
,Dl.DiscontinueDate
,Dl.DiscontinueComments
,dl.TreatmentGoalGrouped
,dl.TreatmentGoal
,dl.[IsAdjuvantTreatment?]
,Case When a.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Nivolumab'
,Case When b.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Ipilimumab'
,Case When c.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Pembrolizumab'
,Case When d.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Atezolizumab'
,Case When e.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Durvalumab'
,Case When F.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Cemiplimab'
,Case When g.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Tremelimumab'
,Case When j.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Avelumab'
,Case When i.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Dostarlimab'
,Case When j.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Relatlimab'
,Case When K.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Botensilimab'
,Case When L.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Balstilimab'

--,Case When j.TREATMENT_PLAN_ID is not null then 1 Else 0 End 'Prednisolone'
,MIN(MedDate) as EarliestMedDate
,Max(MedDate) as LatestMedDate
--,Case When SUM(CASE WHEN CAST(MedDate as daTE)  Between  '2023-03-01' and '2023-06-30' then 1 Else 0 End ) = 0 then 'N' ELSE 'Y' End as MedDateinPeriod
Into #FOI
From #DrugLevelDATA	dl

Left Join Nivolumab_cte a					on a.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join Ipilimumab_cte b					on b.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join Pembrolizumab_cte c				on c.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join Atezolizumab_cte d				on d.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join Durvalumab_cte e					on e.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join Cemiplimab_cte f					on f.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join TREMELIMUMAB_cte g				on g.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join avelumab_cte h					on h.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID

Left Join Dostarlimab_cte i					on i.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join relatlimab_cte j					on j.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
--Left Join Prednisolone_cte j						on j.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join Botensilimab_cte K				on K.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID
Left Join Balstilimab_cte L					on L.TREATMENT_PLAN_ID = dl.TREATMENT_PLAN_ID

GROUP BY 
dl.TREATMENT_PLAN_ID
,dl.MRN
,dl.DateofBirth
,dl.DateofDeath
,dl.Sex
,dl.StageGroupSummary
,dl.StageDescription
,dl.[HER2Status]
,dl.[ClassificationName]
,dl.StageMethodName
,dl.PostCode
,dl.code
,dl.HaemOnc
--,DL.LINE
--,Dl.PROBLEM
,dl.TreatmentPlanStatus
,dl.IsPlanDeletedYN
,dl.LatestUpdateFinYear
,dl.LatestUpdateMonth
,dl.LatestUpdateDateTime
,CASE WHEN CAST(dl.LatestUpdateDateTime as daTE)  > DATEADD(Month,-3,CAST(GETDATE() AS DATE)) THEN 'Yes' ELSE 'No' end
,dl.LatestUpdateUser
,dl.DiagnosisDescription
,dl.PlanType
,dl.TreatmentEpisode
,dl.TreatmentPlan
,dl.TreatmentPlanStartFinYear
,dl.TreatmentPlanStartMonth
,Dl.TreatmentPlanStartDate
,Dl.DiscontinueTreatmentPlanReason
--,Dl.DiscontinuePathwayReason
,dl.DiscontinueFinYear
,dl.DiscontinueMonth
,Dl.DiscontinueDate
,Dl.DiscontinueComments
,dl.TreatmentGoalGrouped
,dl.TreatmentGoal
,dl.[IsAdjuvantTreatment?]
,Case When a.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When b.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When c.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When d.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When e.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When F.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When g.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When h.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When i.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When j.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When k.TREATMENT_PLAN_ID is not null then 1 Else 0 End
,Case When l.TREATMENT_PLAN_ID is not null then 1 Else 0 End
/***************************************** Final Output *****************************************/
DROP TABLE IF EXISTS #FinalOutput1

Select 
	F.*,
	ImpFirst.Prednisolone,
	ImpFirst.OrderMedID as FirstPrednisoloneOrderID,
	ImpLast.OrderMedID as LastPrednisoloneOrderID,
	ImpFirst.LatestRecord as PrednisoloneMedicationCount,
	ImpFirst.EarliestPrednisoloneDate,
	ImpLast.LatestPrednisoloneDate,
	ImpFirst.OrderMinimumDiscreetDose as EarliestPrednisoloneDose,

	IMMFirst.Methylprednisolone,
	IMMFirst.OrderMedID as FirstMethylprednisoloneOrderID,
	IMMLast.OrderMedID as LastMethylprednisoloneOrderID,
	IMMFirst.LatestRecord as MethylprednisoloneMedicationCount,
	IMMFirst.EarliestMethylprednisoloneDate,
	IMMLast.LatestMethylprednisoloneDate,
	IMMFirst.OrderMinimumDiscreetDose as EarliestMethylprednisoloneDose,

	IMIFirst.Infliximab,
	IMIFirst.OrderMedID as FirstInfliximabOrderID,
	IMILast.OrderMedID as LastInfliximabOrderID,
	IMIFirst.LatestRecord as InfliximabMedicationCount,
	IMIFirst.EarliestInfliximabDate,
	IMILast.LatestInfliximabDate,
	IMIFirst.OrderMinimumDiscreetDose as EarliestInfliximabDose,
	
	BFirst.Budesonide,
	BFirst.OrderMedID as FirstBudesonideOrderID,
	BLast.OrderMedID as LastBudesonideOrderID,
	BFirst.LatestRecord as BudesonideMedicationCount,
	BFirst.EarliestBudesonideDate,
	BLast.LatestBudesonideDate,
	BFirst.OrderMinimumDiscreetDose as EarliestBudesonideDose,

	VFirst.Vedolizumab,
	VFirst.OrderMedID as FirstVedolizumabOrderID,
	VLast.OrderMedID as LastVedolizumabOrderID,
	VFirst.LatestRecord as VedolizumabMedicationCount,
	VFirst.EarliestVedolizumabDate,
	VLast.LatestVedolizumabDate,
	VFirst.OrderMinimumDiscreetDose as EarliestVedolizumabDose,

	MMFFirst.MMF,
	MMFFirst.OrderMedID as FirstMFFOrderID,
	MMFLast.OrderMedID as LastMFFOrderID,
	MMFFirst.LatestRecord as MFFMedicationCount,
	MMFFirst.EarliestMMFDate,
	MMFLast.LatestMMFDate,
	MMFFirst.OrderMinimumDiscreetDose as EarliestMMFDose,


	ABFirst.Abatacept,
	ABFirst.OrderMedID as FirstAbataceptOrderID,
	ABLast.OrderMedID as LastAbataceptOrderID,
	ABFirst.LatestRecord as AbataceptMedicationCount,
	ABFirst.EarliestAbataceptDate,
	ABLast.LatestAbataceptDate,
	ABFirst.OrderMinimumDiscreetDose as EarliestAbataceptDose,


	HDFirst.Hydrocortisone,
	HDFirst.OrderMedID as FirstHydrocortisoneOrderID,
	HDLast.OrderMedID as LastHydrocortisoneOrderID,
	HDFirst.LatestRecord as HydrocortisoneMedicationCount,
	HDFirst.EarliestHydrocortisoneDate,
	HDLast.LatestHydrocortisoneDate,
	HDFirst.OrderMinimumDiscreetDose as EarliestHydrocortisoneDose,



	ETFirst.Etanercept,
	ETFirst.OrderMedID as FirstEtanerceptOrderID,
	ETLast.OrderMedID as LastEtanerceptOrderID,
	ETFirst.LatestRecord as EtanerceptMedicationCount,
	ETFirst.EarliestEtanerceptDate,
	ETLast.LatestEtanerceptDate,
	ETFirst.OrderMinimumDiscreetDose as EarliestEtanerceptDose,



	TRFirst.Tacrolimus,
	TRFirst.OrderMedID as FirstTacrolimusOrderID,
	TRLast.OrderMedID as LastTacrolimusOrderID,
	TRFirst.LatestRecord as TacrolimusMedicationCount,
	TRFirst.EarliestTacrolimusDate,
	TRLast.LatestTacrolimusDate,
	TRFirst.OrderMinimumDiscreetDose as EarliestTacrolimusDose,

	TocFirst.Tocilizumab,
	TocFirst.OrderMedID as FirstTocilizumabOrderID,
	TocLast.OrderMedID as LastTocilizumabOrderID,
	TocFirst.LatestRecord as TocilizumabMedicationCount,
	TocFirst.EarliestTocilizumabDate,
	TocLast.LatestTocilizumabDate,
	TocFirst.OrderMinimumDiscreetDose as EarliestTocilizumabDose,

	TopicalFirst.TopicalSteroid,
	TopicalFirst.OrderMedID as FirstTopicalSteroidOrderID,
	TopicalLast.OrderMedID as LastTopicalSteroidOrderID,
	TopicalFirst.LatestRecord as TopicalSteroidMedicationCount,
	TopicalFirst.EarliestTopicalSteroidDate,
	TopicalLast.LatestTopicalSteroidDate,
	TopicalFirst.OrderMinimumDiscreetDose as EarliestTopicalSteroidDose,

	CASE WHEN F.DateofDeath is null then 'N' Else 'Y' end as IsDeceased

INTO
	#FinalOutput1
From 
	#FOI F
	LEFT JOIN #prednisolone ImpFirst
	ON F.MRN = ImpFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImpFirst.TREATMENT_PLAN_ID
	And ImpFirst.EarliestRecord = 1 
	LEFT JOIN #prednisolone ImpLast
	ON F.MRN = ImpLast.PAT_MRN_ID
	--AND F.TreatmentPlanID = ImpLast.TREATMENT_PLAN_ID
	And ImpLast.LatestRecord = 1

	LEFT JOIN #methylprednisolone ImmFirst
	ON F.MRN = ImmFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImmFirst.TREATMENT_PLAN_ID
	And ImmFirst.EarliestRecord = 1
	LEFT JOIN #methylprednisolone ImmLast
	ON F.MRN = ImmLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImmLast.TREATMENT_PLAN_ID
	And ImmLast.LatestRecord = 1

	LEFT JOIN #infliximab ImiFirst
	ON F.MRN = ImiFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And ImiFirst.EarliestRecord = 1
	LEFT JOIN #infliximab ImiLast
	ON F.MRN = ImiLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And ImiLast.LatestRecord = 1	

	LEFT JOIN #Budesonide BFirst
	ON F.MRN = BFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And BFirst.EarliestRecord = 1
	LEFT JOIN #Budesonide BLast
	ON F.MRN = BLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And BLast.LatestRecord = 1	

	LEFT JOIN #Vedolizumab VFirst
	ON F.MRN = VFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And VFirst.EarliestRecord = 1
	LEFT JOIN #Vedolizumab VLast
	ON F.MRN = VLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And VLast.LatestRecord = 1	

	LEFT JOIN #MMF  MMFFirst
	ON F.MRN = MMFFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And MMFFirst.EarliestRecord = 1
	LEFT JOIN #MMF  MMFLast
	ON F.MRN = MMFLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And MMFLast.LatestRecord = 1	


	LEFT JOIN #AB  ABFirst
	ON F.MRN = ABFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And ABFirst.EarliestRecord = 1
	LEFT JOIN #AB  ABLast
	ON F.MRN = ABLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And ABLast.LatestRecord = 1	


	LEFT JOIN #HD  HDFirst
	ON F.MRN = HDFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And HDFirst.EarliestRecord = 1
	LEFT JOIN #HD  HDLast
	ON F.MRN = HDLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And HDLast.LatestRecord = 1	


	LEFT JOIN #ET ETFirst
	ON F.MRN = ETFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And ETFirst.EarliestRecord = 1
	LEFT JOIN #ET  ETLast
	ON F.MRN = ETLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And ETLast.LatestRecord = 1	


	LEFT JOIN #TR  TRFirst
	ON F.MRN = TRFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And TRFirst.EarliestRecord = 1
	LEFT JOIN #TR  TRLast
	ON F.MRN = TRLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And TRLast.LatestRecord = 1	

	LEFT JOIN #Toc  TocFirst
	ON F.MRN = TocFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And TocFirst.EarliestRecord = 1
	LEFT JOIN #Toc  TocLast
	ON F.MRN = TocLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And TocLast.LatestRecord = 1	

	LEFT JOIN #TOPICAL  TopicalFirst
	ON F.MRN = TopicalFirst.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiFirst.TREATMENT_PLAN_ID
	And TopicalFirst.EarliestRecord = 1
	LEFT JOIN #TOPICAL  TopicalLast
	ON F.MRN = TopicalLast.PAT_MRN_ID
--	AND F.TreatmentPlanID = ImiLast.TREATMENT_PLAN_ID
	And TopicalLast.LatestRecord = 1	


Where 1=1
AND 
(
Nivolumab = 1
or Ipilimumab = 1
or Pembrolizumab   = 1 
or Atezolizumab  = 1
or Durvalumab  = 1
or Cemiplimab  = 1
or avelumab = 1
or TREMELIMUMAB   = 1
or Dostarlimab  = 1
or relatlimab  = 1
or Botensilimab  = 1
or Balstilimab  = 1

)
--OR PROBLEM is not null

Order by MRN asc

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
DROP TABLE IF EXISTS #ScansProcedures

SELECT 
	V.*,
	F.TreatmentPlanID,
	F.TreatmentPlanStartDate,
	ROW_NUMBER() OVER (PARTITION BY  F.MRN,F.TreatmentPlanID ORDER BY END_EXAM_DTTM) as ExamOrder
INTO 
	#ScansProcedures
FROM 
	V_IMG_STUDY V
	INNER JOIN #FinalOutput1 F
	ON V.PAT_MRN_ID = F.MRN
	AND v.ORDERING_DTTM > F.TreatmentPlanStartDate
WHERE
	(PROC_NAME Like 'CT%Pelvis%' 
	or PROC_NAME Like 'CT%Abdomen%'
	or PROC_NAME Like 'CT%Chest%'
	OR PROC_NAME Like 'CT%pulmonary%angiogram%'
	OR PROC_NAME Like '%BRONCHOSCOPY%'
	OR PROC_NAME Like '%CARDIAC MRI%'
	OR PROC_NAME Like '%MRI Liver%'
	OR PROC_NAME Like '%COLONOSCOPY%'
	OR PROC_NAME Like '%FLEXIBLE SIGMOIDOSCOPY%'
	OR PROC_NAME Like '%OESOPHAGOGASTRODUODENOSCOPY%'
	OR PROC_NAME Like '%MRCP%'
	)
	AND END_EXAM_DTTM IS NOT NULL
	



------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

DROP TABLE IF EXISTS #OrderComments

select
	O.ORDER_ID AS OrderID,
	CASE 
		--WHEN ORDERING_COMMENT Like '%colitis%'  THEN 'Colitis'
		--WHEN ORDERING_COMMENT Like '%inflammation%' THEN 'Inflammation'
		--WHEN ORDERING_COMMENT Like '%gastritis%' THEN 'Gastritis'
		--WHEN ORDERING_COMMENT Like '%myocarditis%' THEN 'Myocarditis'
		--WHEN ORDERING_COMMENT Like '%Pneumonitis%' THEN 'Pneumonitis'
		WHEN ORDERING_COMMENT Like '%drug toxicity%'THEN 'Drug Toxicity'
		WHEN ORDERING_COMMENT Like '%drug induced inflammation%'THEN 'Drug Induced Inflammation'
		WHEN ORDERING_COMMENT Like '%immune related adverse event%' or ORDERING_COMMENT Like '%irAE%' THEN 'Immune Related Adverse Event (irAE)'
		WHEN ORDERING_COMMENT Like '%immunotherapy toxicity%'THEN 'Immunotherapy Toxicity'
		WHEN ORDERING_COMMENT Like '%Immune-mediated inflammation%'THEN 'Immune-Mediated Inflammation'
		WHEN ORDERING_COMMENT Like '%Pneumonitis%' THEN 'Pneumonitis'
		WHEN ORDERING_COMMENT Like '%immunotherapy granulomatosis%' THEN 'Immunotherapy Granulomatosis'
		WHEN ORDERING_COMMENT Like '%organising pneumonia%' THEN 'Organising Pneumonia'
		WHEN ORDERING_COMMENT Like '%interstitial lung disease%' THEN 'Interstitial Lung Disease'
		WHEN ORDERING_COMMENT Like '%inflammation%' THEN 'Inflammation'
		WHEN ORDERING_COMMENT Like '%colitis%'  THEN 'Colitis'
		WHEN ORDERING_COMMENT Like '%gastritis%' THEN 'Gastritis'
		WHEN ORDERING_COMMENT Like '%oesophagitis%' THEN 'Oesophagitis'
		WHEN ORDERING_COMMENT Like '%duodenitis%' THEN 'Duodenitis'
		WHEN ORDERING_COMMENT Like '%Enteritis%' THEN 'Enteritis'
		WHEN ORDERING_COMMENT Like '%patchy inflammation%' THEN 'Patchy Inflammation'
		WHEN ORDERING_COMMENT Like '%mucositis%' THEN 'Mucositis'
		WHEN ORDERING_COMMENT Like '%mucosal oedema%' THEN 'Mucosal Oedema'
		WHEN ORDERING_COMMENT Like '%esophagitis%' THEN 'Esophagitis'
		WHEN ORDERING_COMMENT Like '%erosions%' THEN 'Erosions'
		WHEN ORDERING_COMMENT Like '%ulcerations%' THEN 'Ulcerations'
		WHEN ORDERING_COMMENT Like '%pericardial effusion%' THEN 'Pericardial Effusion'
		WHEN ORDERING_COMMENT Like '%pericardial thickening%' THEN 'Pericardial Thickening' 
		WHEN ORDERING_COMMENT Like '%myocarditis%' THEN 'Myocarditis'

		WHEN ORDERING_COMMENT Like '%hepatitis%' THEN 'Hepatitis'	
		WHEN ORDERING_COMMENT Like '%transaminitis%' THEN 'Transaminitis'		
		WHEN ORDERING_COMMENT Like '%cholangiopathy%' THEN 'Cholangiopathy'		
		WHEN ORDERING_COMMENT Like '%Cholangitis%' THEN 'Cholangitis'
 		WHEN ORDERING_COMMENT Like '%hepatotoxicity%' THEN 'Hepatotoxicity' 		
		WHEN ORDERING_COMMENT Like '%drug induced liver injury%' THEN 'Drug Induced Liver Injury'
	Else 'Other' ENd as OrderingCommentGroup,
	STRING_AGG(CAST(ORDERING_COMMENT as Nvarchar(MAX)), ', ') WITHIN GROUP (ORDER BY O.Line ASC) AS OrderingComment
into 
	#OrderComments
from 
	ORDER_COMMENT O
	INNER JOIN #ScansProcedures V
	ON O.ORDER_ID = V.ORDER_ID
	--INNER JOIN #FinalOutput1 F
	--ON V.PAT_MRN_ID = F.MRN
	--AND v.ORDERING_DTTM > F.TreatmentPlanStartDate
GROUP BY  
	O.ORDER_ID,
	CASE 
	WHEN ORDERING_COMMENT Like '%drug toxicity%'THEN 'Drug Toxicity'
		WHEN ORDERING_COMMENT Like '%drug induced inflammation%'THEN 'Drug Induced Inflammation'
		WHEN ORDERING_COMMENT Like '%immune related adverse event%' or ORDERING_COMMENT Like '%irAE%' THEN 'Immune Related Adverse Event (irAE)'
		WHEN ORDERING_COMMENT Like '%immunotherapy toxicity%'THEN 'Immunotherapy Toxicity'
		WHEN ORDERING_COMMENT Like '%Immune-mediated inflammation%'THEN 'Immune-Mediated Inflammation'
		WHEN ORDERING_COMMENT Like '%Pneumonitis%' THEN 'Pneumonitis'
		WHEN ORDERING_COMMENT Like '%immunotherapy granulomatosis%' THEN 'Immunotherapy Granulomatosis'
		WHEN ORDERING_COMMENT Like '%organising pneumonia%' THEN 'Organising Pneumonia'
		WHEN ORDERING_COMMENT Like '%interstitial lung disease%' THEN 'Interstitial Lung Disease'
		WHEN ORDERING_COMMENT Like '%inflammation%' THEN 'Inflammation'
		WHEN ORDERING_COMMENT Like '%colitis%'  THEN 'Colitis'
		WHEN ORDERING_COMMENT Like '%gastritis%' THEN 'Gastritis'
		WHEN ORDERING_COMMENT Like '%oesophagitis%' THEN 'Oesophagitis'
		WHEN ORDERING_COMMENT Like '%duodenitis%' THEN 'Duodenitis'
		WHEN ORDERING_COMMENT Like '%Enteritis%' THEN 'Enteritis'
		WHEN ORDERING_COMMENT Like '%patchy inflammation%' THEN 'Patchy Inflammation'
		WHEN ORDERING_COMMENT Like '%mucositis%' THEN 'Mucositis'
		WHEN ORDERING_COMMENT Like '%mucosal oedema%' THEN 'Mucosal Oedema'
		WHEN ORDERING_COMMENT Like '%esophagitis%' THEN 'Esophagitis'
		WHEN ORDERING_COMMENT Like '%erosions%' THEN 'Erosions'
		WHEN ORDERING_COMMENT Like '%ulcerations%' THEN 'Ulcerations'
		WHEN ORDERING_COMMENT Like '%pericardial effusion%' THEN 'Pericardial Effusion'
		WHEN ORDERING_COMMENT Like '%pericardial thickening%' THEN 'Pericardial Thickening' 
		WHEN ORDERING_COMMENT Like '%myocarditis%' THEN 'Myocarditis'

		WHEN ORDERING_COMMENT Like '%hepatitis%' THEN 'Hepatitis'	
		WHEN ORDERING_COMMENT Like '%transaminitis%' THEN 'Transaminitis'		
		WHEN ORDERING_COMMENT Like '%cholangiopathy%' THEN 'Cholangiopathy'		
		WHEN ORDERING_COMMENT Like '%Cholangitis%' THEN 'Cholangitis'
 		WHEN ORDERING_COMMENT Like '%hepatotoxicity%' THEN 'Hepatotoxicity' 		
		WHEN ORDERING_COMMENT Like '%drug induced liver injury%' THEN 'Drug Induced Liver Injury'
	Else 'Other' ENd 

------------------------------------------------------------------------------------

DROP TABLE IF EXISTS #OrderQuestions

select 
	O.ORDER_ID AS OrderID,
	ord_quest_id as QuestionID,
	Quest_NAme as Question,
	CASE 
		--WHEN ORD_QUEST_RESP Like '%colitis%'  THEN 'Colitis'
	WHEN ORD_QUEST_RESP Like '%drug toxicity%'THEN 'Drug Toxicity'
		WHEN ORD_QUEST_RESP Like '%drug induced inflammation%'THEN 'Drug Induced Inflammation'
		WHEN ORD_QUEST_RESP Like '%immune related adverse event%' or ORD_QUEST_RESP Like '%irAE%' THEN 'Immune Related Adverse Event (irAE)'
		WHEN ORD_QUEST_RESP Like '%immunotherapy toxicity%'THEN 'Immunotherapy Toxicity'
		WHEN ORD_QUEST_RESP Like '%Immune-mediated inflammation%'THEN 'Immune-Mediated Inflammation'
		WHEN ORD_QUEST_RESP Like '%Pneumonitis%' THEN 'Pneumonitis'
		WHEN ORD_QUEST_RESP Like '%immunotherapy granulomatosis%' THEN 'Immunotherapy Granulomatosis'
		WHEN ORD_QUEST_RESP Like '%organising pneumonia%' THEN 'Organising Pneumonia'
		WHEN ORD_QUEST_RESP Like '%interstitial lung disease%' THEN 'Interstitial Lung Disease'
		WHEN ORD_QUEST_RESP Like '%inflammation%' THEN 'Inflammation'
		WHEN ORD_QUEST_RESP Like '%colitis%'  THEN 'Colitis'
		WHEN ORD_QUEST_RESP Like '%gastritis%' THEN 'Gastritis'
		WHEN ORD_QUEST_RESP Like '%oesophagitis%' THEN 'Oesophagitis'
		WHEN ORD_QUEST_RESP Like '%duodenitis%' THEN 'Duodenitis'
		WHEN ORD_QUEST_RESP Like '%Enteritis%' THEN 'Enteritis'
		WHEN ORD_QUEST_RESP Like '%patchy inflammation%' THEN 'Patchy Inflammation'
		WHEN ORD_QUEST_RESP Like '%mucositis%' THEN 'Mucositis'
		WHEN ORD_QUEST_RESP Like '%mucosal oedema%' THEN 'Mucosal Oedema'
		WHEN ORD_QUEST_RESP Like '%esophagitis%' THEN 'Esophagitis'
		WHEN ORD_QUEST_RESP Like '%erosions%' THEN 'Erosions'
		WHEN ORD_QUEST_RESP Like '%ulcerations%' THEN 'Ulcerations'
		WHEN ORD_QUEST_RESP Like '%pericardial effusion%' THEN 'Pericardial Effusion'
		WHEN ORD_QUEST_RESP Like '%pericardial thickening%' THEN 'Pericardial Thickening' 
		WHEN ORD_QUEST_RESP Like '%myocarditis%' THEN 'Myocarditis'

		WHEN ORD_QUEST_RESP Like '%hepatitis%' THEN 'Hepatitis'	
		WHEN ORD_QUEST_RESP Like '%transaminitis%' THEN 'Transaminitis'		
		WHEN ORD_QUEST_RESP Like '%cholangiopathy%' THEN 'Cholangiopathy'		
		WHEN ORD_QUEST_RESP Like '%Cholangitis%' THEN 'Cholangitis'
 		WHEN ORD_QUEST_RESP Like '%hepatotoxicity%' THEN 'Hepatotoxicity' 		
		WHEN ORD_QUEST_RESP Like '%drug induced liver injury%' THEN 'Drug Induced Liver Injury'
		Else 'Other' ENd as QuestionGroup,
	STRING_AGG(CAST(ORD_QUEST_RESP as Nvarchar(MAX)), ', ') WITHIN GROUP (ORDER BY O.Line ASC) AS Response
INTO
	#OrderQuestions

from 
	ORD_SPEC_QUEST O
		INNER JOIN #ScansProcedures V
	ON O.ORDER_ID = V.ORDER_ID
	--INNER JOIN #FinalOutput1 F
	--ON V.PAT_MRN_ID = F.MRN
	--AND v.ORDERING_DTTM > F.TreatmentPlanStartDate
	Left JOin CL_QQUEST Q
	On O.ORD_QUEST_ID = Q.QUEST_ID
where 
	ord_quest_id IN( '777008','1055223501')

GROUP BY  
	O.ORDER_ID ,
	ord_quest_id,
	CASE 
	WHEN ORD_QUEST_RESP Like '%drug toxicity%'THEN 'Drug Toxicity'
		WHEN ORD_QUEST_RESP Like '%drug induced inflammation%'THEN 'Drug Induced Inflammation'
		WHEN ORD_QUEST_RESP Like '%immune related adverse event%' or ORD_QUEST_RESP Like '%irAE%' THEN 'Immune Related Adverse Event (irAE)'
		WHEN ORD_QUEST_RESP Like '%immunotherapy toxicity%'THEN 'Immunotherapy Toxicity'
		WHEN ORD_QUEST_RESP Like '%Immune-mediated inflammation%'THEN 'Immune-Mediated Inflammation'
		WHEN ORD_QUEST_RESP Like '%Pneumonitis%' THEN 'Pneumonitis'
		WHEN ORD_QUEST_RESP Like '%immunotherapy granulomatosis%' THEN 'Immunotherapy Granulomatosis'
		WHEN ORD_QUEST_RESP Like '%organising pneumonia%' THEN 'Organising Pneumonia'
		WHEN ORD_QUEST_RESP Like '%interstitial lung disease%' THEN 'Interstitial Lung Disease'
		WHEN ORD_QUEST_RESP Like '%inflammation%' THEN 'Inflammation'
		WHEN ORD_QUEST_RESP Like '%colitis%'  THEN 'Colitis'
		WHEN ORD_QUEST_RESP Like '%gastritis%' THEN 'Gastritis'
		WHEN ORD_QUEST_RESP Like '%oesophagitis%' THEN 'Oesophagitis'
		WHEN ORD_QUEST_RESP Like '%duodenitis%' THEN 'Duodenitis'
		WHEN ORD_QUEST_RESP Like '%Enteritis%' THEN 'Enteritis'
		WHEN ORD_QUEST_RESP Like '%patchy inflammation%' THEN 'Patchy Inflammation'
		WHEN ORD_QUEST_RESP Like '%mucositis%' THEN 'Mucositis'
		WHEN ORD_QUEST_RESP Like '%mucosal oedema%' THEN 'Mucosal Oedema'
		WHEN ORD_QUEST_RESP Like '%esophagitis%' THEN 'Esophagitis'
		WHEN ORD_QUEST_RESP Like '%erosions%' THEN 'Erosions'
		WHEN ORD_QUEST_RESP Like '%ulcerations%' THEN 'Ulcerations'
		WHEN ORD_QUEST_RESP Like '%pericardial effusion%' THEN 'Pericardial Effusion'
		WHEN ORD_QUEST_RESP Like '%pericardial thickening%' THEN 'Pericardial Thickening' 
		WHEN ORD_QUEST_RESP Like '%myocarditis%' THEN 'Myocarditis'

		WHEN ORD_QUEST_RESP Like '%hepatitis%' THEN 'Hepatitis'	
		WHEN ORD_QUEST_RESP Like '%transaminitis%' THEN 'Transaminitis'		
		WHEN ORD_QUEST_RESP Like '%cholangiopathy%' THEN 'Cholangiopathy'		
		WHEN ORD_QUEST_RESP Like '%Cholangitis%' THEN 'Cholangitis'
 		WHEN ORD_QUEST_RESP Like '%hepatotoxicity%' THEN 'Hepatotoxicity' 		
		WHEN ORD_QUEST_RESP Like '%drug induced liver injury%' THEN 'Drug Induced Liver Injury'
		Else 'Other' ENd ,
	Quest_NAme 
------------------------------------------------------------------------------------

DROP TABLE IF EXISTS #OrderNarrative

select
	O.ORDER_PROC_ID AS OrderID,
	CASE 
	WHEN NARRATIVE Like '%drug toxicity%'THEN 'Drug Toxicity'
		WHEN NARRATIVE Like '%drug induced inflammation%'THEN 'Drug Induced Inflammation'
		WHEN NARRATIVE Like '%immune related adverse event%' or NARRATIVE Like '%irAE%' THEN 'Immune Related Adverse Event (irAE)'
		WHEN NARRATIVE Like '%immunotherapy toxicity%'THEN 'Immunotherapy Toxicity'
		WHEN NARRATIVE Like '%Immune-mediated inflammation%'THEN 'Immune-Mediated Inflammation'
		WHEN NARRATIVE Like '%Pneumonitis%' THEN 'Pneumonitis'
		WHEN NARRATIVE Like '%immunotherapy granulomatosis%' THEN 'Immunotherapy Granulomatosis'
		WHEN NARRATIVE Like '%organising pneumonia%' THEN 'Organising Pneumonia'
		WHEN NARRATIVE Like '%interstitial lung disease%' THEN 'Interstitial Lung Disease'
		WHEN NARRATIVE Like '%inflammation%' THEN 'Inflammation'
		WHEN NARRATIVE Like '%colitis%'  THEN 'Colitis'
		WHEN NARRATIVE Like '%gastritis%' THEN 'Gastritis'
		WHEN NARRATIVE Like '%oesophagitis%' THEN 'Oesophagitis'
		WHEN NARRATIVE Like '%duodenitis%' THEN 'Duodenitis'
		WHEN NARRATIVE Like '%Enteritis%' THEN 'Enteritis'
		WHEN NARRATIVE Like '%patchy inflammation%' THEN 'Patchy Inflammation'
		WHEN NARRATIVE Like '%mucositis%' THEN 'Mucositis'
		WHEN NARRATIVE Like '%mucosal oedema%' THEN 'Mucosal Oedema'
		WHEN NARRATIVE Like '%esophagitis%' THEN 'Esophagitis'
		WHEN NARRATIVE Like '%erosions%' THEN 'Erosions'
		WHEN NARRATIVE Like '%ulcerations%' THEN 'Ulcerations'
		WHEN NARRATIVE Like '%pericardial effusion%' THEN 'Pericardial Effusion'
		WHEN NARRATIVE Like '%pericardial thickening%' THEN 'Pericardial Thickening' 
		WHEN NARRATIVE Like '%myocarditis%' THEN 'Myocarditis'

		WHEN NARRATIVE Like '%hepatitis%' THEN 'Hepatitis'	
		WHEN NARRATIVE Like '%transaminitis%' THEN 'Transaminitis'		
		WHEN NARRATIVE Like '%cholangiopathy%' THEN 'Cholangiopathy'		
		WHEN NARRATIVE Like '%Cholangitis%' THEN 'Cholangitis'
 		WHEN NARRATIVE Like '%hepatotoxicity%' THEN 'Hepatotoxicity' 		
		WHEN NARRATIVE Like '%drug induced liver injury%' THEN 'Drug Induced Liver Injury'
	Else 'Other' ENd as OrderNarrativeGroup,
	STRING_AGG(CAST(NARRATIVE as nvarchar(Max)), ', ') WITHIN GROUP (ORDER BY O.Line ASC) AS OrderNarrative
into 
	#OrderNarrative
from 
	ORDER_NARRATIVE O
	INNER JOIN #ScansProcedures V
	ON O.ORDER_PROC_ID = V.ORDER_ID
	--INNER JOIN #FinalOutput1 F
	--ON V.PAT_MRN_ID = F.MRN
	--AND v.ORDERING_DTTM > F.TreatmentPlanStartDate
GROUP BY  
	O.ORDER_PROC_ID,
	CASE 
		WHEN NARRATIVE Like '%drug toxicity%'THEN 'Drug Toxicity'
		WHEN NARRATIVE Like '%drug induced inflammation%'THEN 'Drug Induced Inflammation'
		WHEN NARRATIVE Like '%immune related adverse event%' or NARRATIVE Like '%irAE%' THEN 'Immune Related Adverse Event (irAE)'
		WHEN NARRATIVE Like '%immunotherapy toxicity%'THEN 'Immunotherapy Toxicity'
		WHEN NARRATIVE Like '%Immune-mediated inflammation%'THEN 'Immune-Mediated Inflammation'
		WHEN NARRATIVE Like '%Pneumonitis%' THEN 'Pneumonitis'
		WHEN NARRATIVE Like '%immunotherapy granulomatosis%' THEN 'Immunotherapy Granulomatosis'
		WHEN NARRATIVE Like '%organising pneumonia%' THEN 'Organising Pneumonia'
		WHEN NARRATIVE Like '%interstitial lung disease%' THEN 'Interstitial Lung Disease'
		WHEN NARRATIVE Like '%inflammation%' THEN 'Inflammation'
		WHEN NARRATIVE Like '%colitis%'  THEN 'Colitis'
		WHEN NARRATIVE Like '%gastritis%' THEN 'Gastritis'
		WHEN NARRATIVE Like '%oesophagitis%' THEN 'Oesophagitis'
		WHEN NARRATIVE Like '%duodenitis%' THEN 'Duodenitis'
		WHEN NARRATIVE Like '%Enteritis%' THEN 'Enteritis'
		WHEN NARRATIVE Like '%patchy inflammation%' THEN 'Patchy Inflammation'
		WHEN NARRATIVE Like '%mucositis%' THEN 'Mucositis'
		WHEN NARRATIVE Like '%mucosal oedema%' THEN 'Mucosal Oedema'
		WHEN NARRATIVE Like '%esophagitis%' THEN 'Esophagitis'
		WHEN NARRATIVE Like '%erosions%' THEN 'Erosions'
		WHEN NARRATIVE Like '%ulcerations%' THEN 'Ulcerations'
		WHEN NARRATIVE Like '%pericardial effusion%' THEN 'Pericardial Effusion'
		WHEN NARRATIVE Like '%pericardial thickening%' THEN 'Pericardial Thickening' 
		WHEN NARRATIVE Like '%myocarditis%' THEN 'Myocarditis'

		WHEN NARRATIVE Like '%hepatitis%' THEN 'Hepatitis'	
		WHEN NARRATIVE Like '%transaminitis%' THEN 'Transaminitis'		
		WHEN NARRATIVE Like '%cholangiopathy%' THEN 'Cholangiopathy'		
		WHEN NARRATIVE Like '%Cholangitis%' THEN 'Cholangitis'
 		WHEN NARRATIVE Like '%hepatotoxicity%' THEN 'Hepatotoxicity' 		
		WHEN NARRATIVE Like '%drug induced liver injury%' THEN 'Drug Induced Liver Injury'
	Else 'Other' ENd 





------------------------------------------------------------------------------------
------------------------------------------------------------------------------------

--DROP TABLE IF EXISTS ##Endoscopies

--Select  
--	vi.PAT_MRN_ID as MRN,
--	vi.ORDER_ID as OrderID,
--	OQ.QuestionGroup as OrderQuestionGroup,
--	OQ.Response as OrderQuestion,
--	OC.OrderingCommentGroup,
--	OC.OrderingComment,
--	ORN.OrderNarrativeGroup,
--	ORN.OrderNarrative,

--	Vi.ORDERING_DTTM as OrderDate,
--	vi.ACCESSION_NUM as AccessionNumber,
--	PROC_NAME as ProcedureName,
--	case 
--		when    vi.proc_name in (
--		'DIAGNOSTIC ENDOSCOPIC EXAMINATION OF ILEOANAL POUCH',
--		'ENDOSCOPIC INSERTION OF PH MONITORING CAPSULE INTO ESOPHAGUS',
--		'ENDOSCOPIC RETROGRADE CHOLANGIOPANCREATOGRAPHY',
--		'ENDOSCOPIC ULTRASOUND OF UPPER GASTROINTESTINAL TRACT',
--		'FIBREOPTIC COLONOSCOPY',
--		'FLEXIBLE FIBREOPTIC SIGMOIDOSCOPY',
--		'OESOPHAGOGASTRODUODENOSCOPY (OGD)',
--		'OESOPHAGOGASTRODUODENOSCOPY AND WIRELESS CAPSULE ENDOSCOPY',
--		'PATENCY FOR WIRELESS CAPSULE ENDOSCOPY',
--		'PUSH ENTEROSCOPY',
--		'WIRELESS CAPSULE ENDOSCOPY',
--		'SMALL BOWEL - WIRELESS CAPSULE ENDOSCOPY',
--		'FL ENDO UPPER GI SCREENING',
--		'FL ENDO ERCP',
--		'TRANS-NASAL ENDOSCOPY',

--		'BOWEL CANCER SCREENING COLONOSCOPY',
--		'BOWEL CANCER SCREENING FLEXIBLE SIGMOIDOSCOPY',
--		'BOWEL SCOPE COLONOSCOPY',
--		'BOWEL SCOPE FLEXIBLE SIGMOIDOSCOPY',
--		'OESOPHAGEAL TISSUE SAMPLING USING THE CYTOSPONGE DEVICE')

--		then 'Diagnostic'
--		when   vi.proc_name in (
--		'ENDOSCOPIC PLACEMENT OF GASTROSTOMY TUBE',
--		'EXCISION OF AMPULLA OF VATER',
--		'FIBREOPTIC ENDOSCOPIC DILATION OF UPPER GASTROINTESTINAL TRACT',
--		'FIBREOPTIC ENDOSCOPIC REMOVAL OF GASTROSTOMY TUBE',
--		'INSERTION OF NASOGASTRIC FEEDING TUBE USING ENDOSCOPY FOR UPPER GASTROINTESTINAL TRACT GUIDANCE',
--		'INSERTION OF NASOJEJUNAL FEEDING TUBE USING ENDOSCOPY FOR UPPER GASTROINTESTINAL TRACT GUIDANCE',
--		'POEM - PERORAL ENDOSCOPIC MYOTOMY',
--		'THERAPEUTIC ENDOSCOPIC PROCEDURE',
--		'FL NASOJEJUNAL FEEDING TUBE')

--		then 'Therapeutic'
--		else 'Check'
--		end as DiagnosticTherapeutic,
--	case 
--		when  vi.proc_name =    'FIBREOPTIC COLONOSCOPY' then 'Colonoscopy'
--		when  vi.proc_name in (
--								'ENDOSCOPIC INSERTION OF PH MONITORING CAPSULE INTO ESOPHAGUS',
--								'OESOPHAGOGASTRODUODENOSCOPY (OGD)',
--								'OESOPHAGOGASTRODUODENOSCOPY AND WIRELESS CAPSULE ENDOSCOPY',
--								'PATENCY FOR WIRELESS CAPSULE ENDOSCOPY',
--								'PUSH ENTEROSCOPY',
--								'WIRELESS CAPSULE ENDOSCOPY',
--								'SMALL BOWEL - WIRELESS CAPSULE ENDOSCOPY')

--								then 'Gastroscopy'

--		when  vi.proc_name in ( 'DIAGNOSTIC ENDOSCOPIC EXAMINATION OF ILEOANAL POUCH',
--								'FLEXIBLE FIBREOPTIC SIGMOIDOSCOPY')
												  
--								then 'Flexible Sigmoidoscopy'
                         
--		when  vi.proc_name =    'ENDOSCOPIC ULTRASOUND OF UPPER GASTROINTESTINAL TRACT'

--								then 'Ultrasound'
--								else 'N/A'
--								end Modality,
--	case 
--		when   vi.proc_name in (
--								'BOWEL CANCER SCREENING COLONOSCOPY',
--								'BOWEL CANCER SCREENING FLEXIBLE SIGMOIDOSCOPY',
--								'BOWEL SCOPE COLONOSCOPY',
--								'BOWEL SCOPE FLEXIBLE SIGMOIDOSCOPY')

--								then 'Bowel Canc Scope/Screening'

--		when vi.proc_name  in ( 
--								'DIAGNOSTIC ENDOSCOPIC EXAMINATION OF ILEOANAL POUCH',
--								'EXCISION OF AMPULLA OF VATER',
--								'FIBREOPTIC COLONOSCOPY',
--								'FLEXIBLE FIBREOPTIC SIGMOIDOSCOPY',
--								'PATENCY FOR WIRELESS CAPSULE ENDOSCOPY',
--								'WIRELESS CAPSULE ENDOSCOPY',
--								'SMALL BOWEL - WIRELESS CAPSULE ENDOSCOPY')

--								then 'Lower GI'

--		when vi.proc_name    in ('ENDOSCOPIC INSERTION OF PH MONITORING CAPSULE INTO ESOPHAGUS',
--								'ENDOSCOPIC PLACEMENT OF GASTROSTOMY TUBE',
--								'ENDOSCOPIC RETROGRADE CHOLANGIOPANCREATOGRAPHY',
--								'ENDOSCOPIC ULTRASOUND OF UPPER GASTROINTESTINAL TRACT',
--								'FIBREOPTIC ENDOSCOPIC DILATION OF UPPER GASTROINTESTINAL TRACT',
--								'FIBREOPTIC ENDOSCOPIC REMOVAL OF GASTROSTOMY TUBE',
--								'INSERTION OF NASOGASTRIC FEEDING TUBE USING ENDOSCOPY FOR UPPER GASTROINTESTINAL TRACT GUIDANCE',
--								'INSERTION OF NASOJEJUNAL FEEDING TUBE USING ENDOSCOPY FOR UPPER GASTROINTESTINAL TRACT GUIDANCE',
--								'OESOPHAGOGASTRODUODENOSCOPY (OGD)',
--								'OESOPHAGOGASTRODUODENOSCOPY AND WIRELESS CAPSULE ENDOSCOPY',
--								'POEM - PERORAL ENDOSCOPIC MYOTOMY',
--								'PUSH ENTEROSCOPY',
--								'TRANS-NASAL ENDOSCOPY',
--								'OESOPHAGEAL TISSUE SAMPLING USING THE CYTOSPONGE DEVICE',
--								'THERAPEUTIC ENDOSCOPIC PROCEDURE',
--								'FL ENDO UPPER GI SCREENING',
--								'FL ENDO ERCP',
--								'FL NASOJEJUNAL FEEDING TUBE')

--								then 'Upper GI'
--								else 'Check'
--								end DailyReturnCategory,
--	BEGIN_EXAM_DTTM as ExamStartDate,
--	END_EXAM_DTTM as ExamEndDate,
--	F.TreatmentPlanID,
--	F.TreatmentPlanStartDate,
--	ROW_NUMBER() OVER (PARTITION BY  F.MRN,F.TreatmentPlanID ORDER BY END_EXAM_DTTM) as ExamOrder

--INTO
--	##Endoscopies

--from 
--	V_IMG_STUDY vi      
--	INNER JOIN #FinalOutput1 F
--	ON vi.PAT_MRN_ID = F.MRN
--	AND vi.ORDERING_DTTM > F.TreatmentPlanStartDate
--	LEFT JOIN #OrderQuestions OQ
--	on OQ.OrderID = vi.ORDER_ID
--	LEFT JOIN #OrderComments OC
--	on OC.OrderID = vi.ORDER_ID
--	LEFT JOIN #OrderNarrative ORN
--	on ORN.OrderID = vi.ORDER_ID
--Where 
--(PROC_NAME Like '%COLONOSCOPY%'
--	OR PROC_NAME Like '%FLEXIBLE SIGMOIDOSCOPY%'
--	OR PROC_NAME Like '%OESOPHAGOGASTRODUODENOSCOPY%' )
--	AND END_EXAM_DTTM IS NOT NULL


DROP TABLE IF EXISTS ##Scans

Select  
	vi.PAT_MRN_ID as MRN,
	vi.ORDER_ID as OrderID,
	OQ.QuestionGroup as OrderQuestionGroup,
	OQ.Response as OrderQuestion,
	OC.OrderingCommentGroup,
	OC.OrderingComment,
	ORN.OrderNarrativeGroup,
	ORN.OrderNarrative,
	Vi.ORDERING_DTTM as OrderDate,
	vi.ACCESSION_NUM as AccessionNumber,
	PROC_NAME as ProcedureName,
	BEGIN_EXAM_DTTM as ExamStartDate,
	END_EXAM_DTTM as ExamEndDate,
	vi.TreatmentPlanID,
	vi.TreatmentPlanStartDate,
	vi.ExamOrder

INTO
	##Scans
from 
	#ScansProcedures vi      
	--INNER JOIN #FinalOutput1 F
	--ON vi.PAT_MRN_ID = F.MRN
	--AND vi.ORDERING_DTTM > F.TreatmentPlanStartDate
	LEFT JOIN #OrderQuestions OQ
	on OQ.OrderID = vi.ORDER_ID
	LEFT JOIN #OrderComments OC
	on OC.OrderID = vi.ORDER_ID
	LEFT JOIN #OrderNarrative ORN
	on ORN.OrderID = vi.ORDER_ID


Where 
	
	--(PROC_NAME Like 'CT%Pelvis%' 
	--or PROC_NAME Like 'CT%Abdomen%'
	--or PROC_NAME Like 'CT%Chest%'
	--)
	--AND END_EXAM_DTTM IS NOT NULL)
	--AND 
	(ISNUll(OQ.QuestionGroup,'Other') <> 'Other'
	OR ISNUll(OC.OrderingCommentGroup,'Other') <> 'Other'
	OR ISNUll(ORN.OrderNarrativeGroup,'Other') <> 'Other'
)


DROP TABLE IF EXISTS ##FAECALCALPROTECTIN

Select 
	OP.ORDER_PROC_ID as OrderID,
	F.MRN,
	OP.ORDER_TIME as OrderDateTime,
	PROC_START_TIME as ProcedureStartDateTime,
	ORR.RESULT_TIME as ResultDateTime,
	PROC_NAME as ProcedureName,
	DESCRIPTION,
	OP.ABNORMAL_YN as Abnormal,
	ORR.OrD_VAlue as OrderResults,
	ORR.ORD_NUM_VALUE as OrderResultsNumeric,
	F.TreatmentPlanID,
	F.TreatmentPlanStartDate,
	ROW_NUMBER() OVER (PARTITION BY  F.MRN,F.TreatmentPlanID ORDER BY ORR.RESULT_TIME) as ResultOrder
INTO
	##FAECALCALPROTECTIN

from 
	ORDER_PROC OP
	LEFT JOIN PATIENT P
	ON OP.PAT_ID = P.PAT_ID
	INNER JOIN #FinalOutput1 F
	ON P.PAT_MRN_ID = F.MRN
	AND OP.ORDERING_DATE > F.TreatmentPlanStartDate
	LEFT join clarity_eap eap
	on eap.PROC_ID = op.PROC_ID
	LEFT JOIN ORDER_RESULTS ORR
	ON OP.ORDER_PROC_ID = ORR.ORDER_PROC_ID
where 
	OP.PROC_ID = '113450'
	AND ORR.RESULT_TIME is not null

DROP TABLE IF EXISTS #ProblemList

Select DISTINCT
	F.MRN,
	PR.PROBLEM_LIST_ID as ProblemListID,
	PR.NOTED_DATE as ProblemStartDate,
	PR.RESOLVED_DATE as ProblemEndDate,
	PR.PROBLEM_CMT as ProblemComment,
	dia.DX_NAME as Problem

INTO
#ProblemList
from 
	PROBLEM_LIST PR
	LEFT JOIN PATIENT P
	ON PR.PAT_ID = P.PAT_ID
	INNER JOIN #FinalOutput1 F
	ON P.PAT_MRN_ID = F.MRN
	LEFT JOIN CLARITY_EDG dia
	ON PR.DX_ID = dia.DX_ID

WHERE 
	DX_NAME Like '%colitis%'  
	OR DX_NAME Like '%inflammation%' 
	OR DX_NAME Like '%gastritis%' 
	OR DX_NAME Like '%myocarditis%' 
	OR DX_NAME Like '%Pneumonitis%' 
ORDER BY 1



drop table if exists #proBNP
select 
	pt.PAT_MRN_ID,
	F.TreatmentPlanID,
	enc.PAT_ENC_CSN_ID,
	ord.ORDER_PROC_ID,
	eap.ORDER_DISPLAY_NAME,
	cc.EXTERNAL_NAME [COMPONENT],
	ord.ORDER_TIME,
	res.RESULT_DATE,
	res.ORD_NUM_VALUE [RESULT_VALUE],
	Case When res.ORD_NUM_VALUE < 1 then 'Yes' Else 'No' End [VALUE_<1],
	ROW_NUMBER()Over(Partition By enc.PAT_ENC_CSN_ID,F.TreatmentPlanID Order By res.RESULT_DATE) [RESULT_ORDER],
	ROW_NUMBER()Over(Partition By enc.PAT_ENC_CSN_ID,F.TreatmentPlanID,Case When res.ORD_NUM_VALUE < 1 then 'Yes' Else 'No' End Order By res.RESULT_DATE) [RESULT_<1_ORDER]
Into #proBNP
from 
	CLARITY_REPORT.dbo.PAT_ENC enc
	left join CLARITY_REPORT.dbo.PATIENT pt										
	on enc.PAT_ID = pt.PAT_ID
	INNER JOIN #FinalOutput1 F
	ON pt.PAT_MRN_ID = F.MRN
	AND enc.CONTACT_DATE > F.TreatmentPlanStartDate
	left join CLARITY_REPORT.dbo.ORDER_PROC ord									
	on enc.PAT_ENC_CSN_ID = ord.PAT_ENC_CSN_ID
	Left Join CLARITY_REPORT.dbo.CLARITY_EAP eap								
	on ord.PROC_ID = eap.PROC_ID
	Left Join CLARITY_REPORT.dbo.ORDER_RESULTS res								
	on ord.ORDER_PROC_ID = res.ORDER_PROC_ID
	Left Join CLARITY_REPORT.dbo.CLARITY_COMPONENT cc							
	on res.COMPONENT_ID = cc.COMPONENT_ID
where 1=1
--and( cc.EXTERNAL_NAME IN ('Cardiac Troponin T','Troponin I(High Sensitivity)')--,'NT-proBNP')
--AND (res.ORD_NUM_VALUE  >=50  and res.ORD_NUM_VALUE <9999999))
 AND (cc.EXTERNAL_NAME IN ('NT-proBNP')
 AND (res.ORD_NUM_VALUE  >=400  and res.ORD_NUM_VALUE <9999999))

 
drop table if exists #Troponin
select 
	pt.PAT_MRN_ID,
	F.TreatmentPlanID,
	enc.PAT_ENC_CSN_ID,
	ord.ORDER_PROC_ID,
	eap.ORDER_DISPLAY_NAME,
	cc.EXTERNAL_NAME [COMPONENT],
	ord.ORDER_TIME,
	res.RESULT_DATE,
	res.ORD_NUM_VALUE [RESULT_VALUE],
	Case When res.ORD_NUM_VALUE < 1 then 'Yes' Else 'No' End [VALUE_<1],
	ROW_NUMBER()Over(Partition By enc.PAT_ENC_CSN_ID,F.TreatmentPlanID Order By res.RESULT_DATE) [RESULT_ORDER],
	ROW_NUMBER()Over(Partition By enc.PAT_ENC_CSN_ID,F.TreatmentPlanID,Case When res.ORD_NUM_VALUE < 1 then 'Yes' Else 'No' End Order By res.RESULT_DATE) [RESULT_<1_ORDER]
Into #Troponin
from 
	CLARITY_REPORT.dbo.PAT_ENC enc
	left join CLARITY_REPORT.dbo.PATIENT pt										
	on enc.PAT_ID = pt.PAT_ID
	INNER JOIN #FinalOutput1 F
	ON pt.PAT_MRN_ID = F.MRN
	AND enc.CONTACT_DATE > F.TreatmentPlanStartDate
	left join CLARITY_REPORT.dbo.ORDER_PROC ord									
	on enc.PAT_ENC_CSN_ID = ord.PAT_ENC_CSN_ID
	Left Join CLARITY_REPORT.dbo.CLARITY_EAP eap								
	on ord.PROC_ID = eap.PROC_ID
	Left Join CLARITY_REPORT.dbo.ORDER_RESULTS res								
	on ord.ORDER_PROC_ID = res.ORDER_PROC_ID
	Left Join CLARITY_REPORT.dbo.CLARITY_COMPONENT cc							
	on res.COMPONENT_ID = cc.COMPONENT_ID
where 1=1
and( cc.EXTERNAL_NAME IN ('Cardiac Troponin T','Troponin I(High Sensitivity)')--,'NT-proBNP')
AND (res.ORD_NUM_VALUE  >=50  and res.ORD_NUM_VALUE <9999999))
 --AND (cc.EXTERNAL_NAME IN ('NT-proBNP')
 --AND (res.ORD_NUM_VALUE  >=400  and res.ORD_NUM_VALUE <9999999))


drop table if exists ##BloodTests

 SELECT 
	X.*,
	ROW_NUMBER() OVER (PARTITION BY MRN,TreatmentPlanID ORDER BY OrderDate asc) AS BloodOrder

INTO
	##BloodTests
FROM(

Select
	A.PAT_MRN_ID as MRN,
	A.TreatmentPlanID,
	A.PAT_ENC_CSN_ID as CSN,
	A.ORDER_TIME as OrderDate,

 	A.COMPONENT as NTproBNP,
	A.RESULT_VALUE as NTproBNPValue,
	A.RESULT_DATE as NTproBNPResultDate,
 	B.COMPONENT as Troponin,
	B.RESULT_VALUE as TroponinValue,
	B.RESULT_DATE as TroponinResultDate

from 
	#proBNP A
	INNER JOIN #Troponin B
	ON A.PAT_ENC_CSN_ID = B.PAT_ENC_CSN_ID
	AND A.TreatmentPlanID = B.TreatmentPlanID
	AND B.RESULT_ORDER = 1

WHERE
	A.RESULT_ORDER = 1
  ) X


  



DROP TABLE IF EXISTS ##ProblemListSkin

Select DISTINCT
	F.MRN,
	--PR.PROBLEM_LIST_ID as ProblemListID,
	PR.NOTED_DATE as ProblemStartDate,
	PR.RESOLVED_DATE as ProblemEndDate,
	--PR.PROBLEM_CMT as ProblemComment,
	dia.DX_NAME as Problem

INTO
##ProblemListSkin
from 
	PROBLEM_LIST PR
	LEFT JOIN PATIENT P
	ON PR.PAT_ID = P.PAT_ID
	INNER JOIN #FinalOutput1 F
	ON P.PAT_MRN_ID = F.MRN
	LEFT JOIN CLARITY_EDG dia
	ON PR.DX_ID = dia.DX_ID

WHERE 
	DX_NAME like '%dermatomyositis%'
	OR DX_NAME like '%severe cutaneous adverse reactions%' 
	OR DX_NAME like '%stevens-johnson syndrome%'  OR DX_NAME like '%SJS%' 
	OR DX_NAME like '%toxic epidermal necrolysis%'
	OR DX_NAME like '%pemphigoid%'
	OR DX_NAME like '%pemphigus%' 
	OR DX_NAME like '%linear IgA dermatosis%' 
	OR DX_NAME like '%eosinophilia%'
	OR DX_NAME like '%exanthematous pustulosis%' 
	OR DX_NAME like '%sweet syndrome%' 
	OR DX_NAME like '%pyoderma gangrenosum%' 
	OR DX_NAME like '%cutaneous vasculitis%' 
	OR DX_NAME like '%rythroderma%' 
	OR DX_NAME like '%alopecia areata%' 
	OR DX_NAME like '%eosinophilic fasciitis%' 
	OR DX_NAME like '%scleroderma%' 
	OR DX_NAME like '%erythema nodosum%'
	OR DX_NAME like '%Sjogren syndrome%' 
	OR DX_NAME like '%suprabasal acantholytic dermatoses%'
ORDER BY 1



DROP TABLE IF EXISTS ##FINAL
SelecT 

	F1.*,
	Pr.Problem as ProblemListEntry,
	Pr.ProblemComment as ProblemListComment,
	PLS.Problem as SkinProblemListEntry,
	Pr.ProblemStartDate,
	Pr.ProblemEndDate,
	CT.OrderID as ScanOrderID,
	CT.OrderQuestionGroup as ScanOrderQuestionGroup,
	CT.OrderQuestion as ScanOrderQuestion,
	CT.OrderingCommentGroup as ScanOrderingCommentGroup,
	CT.OrderingComment as ScanOrderingComment,
	CT.OrderNarrativeGroup as ScanOrderNarrativeGroup,
	CT.OrderNarrative as ScanOrderNarrative,
	CT.OrderDate as ScanOrderDate,
	CT.AccessionNumber as ScanAccessionNumber,
	CT.ProcedureName as ScanProcedureName,
	CT.ExamStartDate as ScanExamStartDate,
	CT.ExamEndDate as ScanExamEndDate,


--	E.OrderID as EndoscopyOrderID,
--	E.OrderQuestionGroup as EndoscopyOrderQuestionGroup,
--	E.OrderQuestion as EndoscopyOrderQuestion,
--	E.OrderingCommentGroup as EndoscopyOrderingCommentGroup,
--	E.OrderingComment as EndoscopyOrderingComment,
--	E.OrderNarrativeGroup as EndoscopyOrderNarrativeGroup,
--	E.OrderNarrative as EndoscopyOrderNarrative,
--	E.OrderDate as EndoscopyOrderDate,
--	E.AccessionNumber as EndoscopyAccessionNumber,
--	E.ProcedureName as EndoscopyProcedureName,
--	E.DiagnosticTherapeutic as EndoscopyDiagnosticTherapeutic,
--	E.Modality as EndoscopyModality,
----	E.DailyReturnCategory as EndoscopyDailyReturnCategory,
--	E.ExamStartDate as EndoscopyExamStartDate,
--	E.ExamEndDate as EndoscopyExamEndDate,

	FC.OrderID as FaecalCalprotectinOrderID,
	FC.OrderDateTime as FaecalCalprotectinOrderDateTime,
	FC.ProcedureStartDateTime as FaecalCalprotectinProcedureStartDateTime,
	FC.ResultDateTime as FaecalCalprotectinResultDateTime,
	FC.ProcedureName as FaecalCalprotectinProcedureName,
	
	FC.Abnormal as FaecalCalprotectinAbnormal,
	FC.OrderResults as FaecalCalprotectinResults,
	FC.OrderResultsNumeric as FaecalCalprotectinResultsNumeric,

	BT.OrderDate as BloodTestOrderDate,
 	BT.NTproBNP,
	BT.NTproBNPValue,
	BT.NTproBNPResultDate,
 	BT.Troponin,
	BT.TroponinValue,
	BT.TroponinResultDate


INTO
	##FINAL

from 
	#FinalOutput1 F1
	LEFT JOIN #ProblemList Pr
	ON  F1.MRN  = Pr.MRN
	LEFT JOIN ##ProblemListSkin PLS
	ON  F1.MRN  = PLS.MRN	
	--LEFT JOIN ##Endoscopies E
	--ON F1.TreatmentPlanID  = E.TreatmentPlanID
	--AND  F1.MRN  = E.MRN
	--AND E.ExamOrder = 1
	LEFT JOIN ##Scans CT
	ON F1.TreatmentPlanID  = CT.TreatmentPlanID
	AND  F1.MRN  = CT.MRN
	AND CT.ExamOrder = 1
	LEFT JOIN ##FAECALCALPROTECTIN FC
	ON F1.TreatmentPlanID  = FC.TreatmentPlanID
	AND  F1.MRN  = FC.MRN
	AND FC.ResultOrder = 1
	LEFT JOIN ##BloodTests BT
	ON F1.TreatmentPlanID  = BT.TreatmentPlanID
	AND  F1.MRN  = BT.MRN
	AND BT.BloodOrder = 1

	Select * from ##FINAL