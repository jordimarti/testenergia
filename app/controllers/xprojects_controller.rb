class XprojectsController < ApplicationController
  before_filter :authenticate_expert!
  before_filter :report_reader, :only => [ :update ]

  def index
    this_expert = Expert.find(current_expert.id)
    @xprojects = this_expert.xprojects
  end

  def show
    @xproject = Xproject.find(params[:id])
    @improvements = @xproject.improvements
  end

  def new
    @xproject = Xproject.new
    
    @building_systems_year = '1970'
    #Remove the last number of the year and add a zero, as in database we are storing decades
    @building_systems_decade = @building_systems_year[0..-2]+'0'
    #@building_systems = BuildingSystem.select('system_type, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0').order('y'+@building_systems_decade+' DESC')
    @building_single_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret un full\'').order('y'+@building_systems_decade+' DESC')
    @building_double_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret de doble full\'').order('y'+@building_systems_decade+' DESC')
    @building_flat_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta plana\'').order('y'+@building_systems_decade+' DESC')
    @building_slanted_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta inclinada\'').order('y'+@building_systems_decade+' DESC')
    @building_floor = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Terra\'').order('y'+@building_systems_decade+' DESC')
  end

  def create
    @xproject = Xproject.new(xproject_params)
    # Save the object
    if @xproject.save
      # If save succeeds, redirect to the index action
      #flash[:notice] = "El projecte s'ha creat correctament."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def create_from_project
    @xproject = Xproject.new(xproject_params)
    # Save the object
    if @xproject.save
      # If save succeeds, redirect to the index action
      #flash[:notice] = "El projecte s'ha creat correctament."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @xproject = Xproject.find(params[:id])
    if @xproject.user_id
      @user = User.find(@xproject.user_id)
    end
    @building_systems_year = @xproject.construction_year
    #Remove the last number of the year and add a zero, as in database we are storing decades
    @building_systems_decade = @building_systems_year[0..-2]+'0'
    #@building_systems = BuildingSystem.select('system_type, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0').order('y'+@building_systems_decade+' DESC')
    @building_single_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret un full\'').order('y'+@building_systems_decade+' DESC')
    @building_double_sheet_walls = BuildingSystem.select('score, name, thickness, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Paret de doble full\'').order('y'+@building_systems_decade+' DESC')
    @building_flat_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta plana\'').order('y'+@building_systems_decade+' DESC')
    @building_slanted_roof = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Coberta inclinada\'').order('y'+@building_systems_decade+' DESC')
    @building_floor = BuildingSystem.select('score, name, y'+@building_systems_decade+' as decade').where('y'+@building_systems_decade+' > 0 AND system_type = \'Terra\'').order('y'+@building_systems_decade+' DESC')
  end

  def update
    # Find an existing object using form parameters
    @xproject = Xproject.find(params[:id])
    # Update the object
    if @xproject.update_attributes(xproject_params)
      # If save succeeds, redirect to the index action
      #flash[:notice] = "Les dades del projecte s'han gravat correctament."
      redirect_to(:action => 'edit', :id => @xproject.id)
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def report_reader
    # Read data from CE3X report and save to database
    unless params[:xproject][:report_results].empty?
      params[:xproject][:global_emissions] = params[:xproject][:report_results].lines.at(22).split(" ").first
      
      params[:xproject][:global_emissions_rating] = params[:xproject][:report_results].lines.at(2).split(" ").at(3)
      if !params[:xproject][:global_emissions_rating]
        params[:xproject][:global_emissions_rating] = params[:xproject][:report_results].lines.at(3).split(" ").at(3)
        if !params[:xproject][:global_emissions_rating]
          params[:xproject][:global_emissions_rating] = params[:xproject][:report_results].lines.at(4).split(" ").at(3)
          if !params[:xproject][:global_emissions_rating]
            params[:xproject][:global_emissions_rating] = params[:xproject][:report_results].lines.at(5).split(" ").at(3)
            if !params[:xproject][:global_emissions_rating]
              params[:xproject][:global_emissions_rating] = params[:xproject][:report_results].lines.at(6).split(" ").at(3)
              if !params[:xproject][:global_emissions_rating]
                params[:xproject][:global_emissions_rating] = params[:xproject][:report_results].lines.at(7).split(" ").at(3)
                if !params[:xproject][:global_emissions_rating]
                  params[:xproject][:global_emissions_rating] = params[:xproject][:report_results].lines.at(8).split(" ").at(3)
                end
              end
            end
          end
        end
      end

      params[:xproject][:heating_emissions] = params[:xproject][:report_results].lines.at(15).split(" ").first
      params[:xproject][:heating_emissions_rating] = params[:xproject][:report_results].lines.at(10).split(" ").first
      params[:xproject][:hot_water_emissions] = params[:xproject][:report_results].lines.at(15).split(" ").last
      params[:xproject][:hot_water_emissions_rating] = params[:xproject][:report_results].lines.at(10).split(" ").last
      params[:xproject][:cooling_emissions] = params[:xproject][:report_results].lines.at(22).split(" ").at(1)
      params[:xproject][:cooling_emissions_rating] = params[:xproject][:report_results].lines.at(17).split(" ").first
      params[:xproject][:heating_demand] = params[:xproject][:report_results].lines.at(44).split(" ").first
      
      params[:xproject][:heating_demand_rating] = params[:xproject][:report_results].lines.at(29).split(" ").at(3)
      if !params[:xproject][:heating_demand_rating]
        params[:xproject][:heating_demand_rating] = params[:xproject][:report_results].lines.at(30).split(" ").at(3)
        if !params[:xproject][:heating_demand_rating]
          params[:xproject][:heating_demand_rating] = params[:xproject][:report_results].lines.at(31).split(" ").at(3)
          if !params[:xproject][:heating_demand_rating]
            params[:xproject][:heating_demand_rating] = params[:xproject][:report_results].lines.at(32).split(" ").at(3)
            if !params[:xproject][:heating_demand_rating]
              params[:xproject][:heating_demand_rating] = params[:xproject][:report_results].lines.at(33).split(" ").at(3)
              if !params[:xproject][:heating_demand_rating]
                params[:xproject][:heating_demand_rating] = params[:xproject][:report_results].lines.at(34).split(" ").at(3)
                if !params[:xproject][:heating_demand_rating]
                  params[:xproject][:heating_demand_rating] = params[:xproject][:report_results].lines.at(35).split(" ").at(3)
                end
              end
            end
          end
        end
      end

      params[:xproject][:cooling_demand] = params[:xproject][:report_results].lines.at(44).split(" ").last
      
      params[:xproject][:cooling_demand_rating] = params[:xproject][:report_results].lines.at(36).split(" ").at(3)
      if !params[:xproject][:cooling_demand_rating]
        params[:xproject][:cooling_demand_rating] = params[:xproject][:report_results].lines.at(37).split(" ").at(3)
        if !params[:xproject][:cooling_demand_rating]
          params[:xproject][:cooling_demand_rating] = params[:xproject][:report_results].lines.at(38).split(" ").at(3)
          if !params[:xproject][:cooling_demand_rating]
            params[:xproject][:cooling_demand_rating] = params[:xproject][:report_results].lines.at(39).split(" ").at(3)
            if !params[:xproject][:cooling_demand_rating]
              params[:xproject][:cooling_demand_rating] = params[:xproject][:report_results].lines.at(40).split(" ").at(3)
              if !params[:xproject][:cooling_demand_rating]
                params[:xproject][:cooling_demand_rating] = params[:xproject][:report_results].lines.at(41).split(" ").at(3)
                if !params[:xproject][:cooling_demand_rating]
                  params[:xproject][:cooling_demand_rating] = params[:xproject][:report_results].lines.at(42).split(" ").at(3)
                end
              end
            end
          end
        end
      end
      params[:xproject][:global_primary_energy] = params[:xproject][:report_results].lines.at(69).split(" ").first
      
      params[:xproject][:global_primary_energy_rating] = params[:xproject][:report_results].lines.at(49).split(" ").at(3)
      if !params[:xproject][:global_primary_energy_rating]
        params[:xproject][:global_primary_energy_rating] = params[:xproject][:report_results].lines.at(50).split(" ").at(3)
        if !params[:xproject][:global_primary_energy_rating]
          params[:xproject][:global_primary_energy_rating] = params[:xproject][:report_results].lines.at(51).split(" ").at(3)
          if !params[:xproject][:global_primary_energy_rating]
            params[:xproject][:global_primary_energy_rating] = params[:xproject][:report_results].lines.at(52).split(" ").at(3)
            if !params[:xproject][:global_primary_energy_rating]
              params[:xproject][:global_primary_energy_rating] = params[:xproject][:report_results].lines.at(53).split(" ").at(3)
              if !params[:xproject][:global_primary_energy_rating]
                params[:xproject][:global_primary_energy_rating] = params[:xproject][:report_results].lines.at(54).split(" ").at(3)
                if !params[:xproject][:global_primary_energy_rating]
                  params[:xproject][:global_primary_energy_rating] = params[:xproject][:report_results].lines.at(55).split(" ").at(3)
                end
              end
            end
          end
        end
      end

      params[:xproject][:heating_primary_energy] = params[:xproject][:report_results].lines.at(62).split(" ").first
      params[:xproject][:heating_primary_energy_rating] = params[:xproject][:report_results].lines.at(57).split(" ").first
      params[:xproject][:hot_water_primary_energy] = params[:xproject][:report_results].lines.at(62).split(" ").last
      params[:xproject][:hot_water_primary_energy_rating] = params[:xproject][:report_results].lines.at(57).split(" ").last
      params[:xproject][:cooling_primary_energy] = params[:xproject][:report_results].lines.at(69).split(" ").at(1)
      params[:xproject][:cooling_primary_energy_rating] = params[:xproject][:report_results].lines.at(64).split(" ").first
    end
  end

  def delete
    @xproject = Xproject.find(params[:id])
  end

  def destroy
    xproject = Xproject.find(params[:id]).destroy
    #flash[:notice] = "El projecte '#{xproject.name}' ha estat correctament eliminat."
    redirect_to(:action => 'index')
  end

  def create_improvement
    @improvement = Improvement.new(improvement_params)
    @improvement.save
  end

  def write_file
    xproject = Xproject.find(params[:id])
    client_id = xproject.user_id
    client = User.find(client_id)

    File.atomic_write('cex/arxiu'+params[:id]+'.cex') do |file|
      cex_file = "S'CEXv1.1 Residencial'
p0
.(lp0
V" + xproject.name + "
p1
aV" + xproject.address + "
p2
aVBarcelona 
p3
aVBarcelona
p4
aV
p5
aV" + client.first_name + " " + client.surname1 + " " + client.surname2 + "
p6
ag5
aVDirecció client
p7
aV935535450
p8
aVjordimarti@me.com
p9
aVRaó social
p10
aVNom del tècnic
p11
aV670410706
p12
aVjordi.marti@apabcn.cat
p13
aV08010
p14
aV1111111909
p15
aVBarcelona
p16
aVBarcelona
p17
aV08010
p18
aV36531630
p19
aVB40145
p20
aVDirecció tècnic
p21
aVBarcelona
p22
aVBarcelona
p23
aV08010
p24
aVArquitecte Tècnic
p25
a.(lp0
V
p1
ag1
aVBarcelona
p2
aVBarcelona 
p3
aVC2
p4
aVII
p5
ag1
aV2.7
p6
ag1
aV0
p7
aVMedia
p8
aI00
ag1
a(lp9
I00
ag1
ag1
aaI00
aS'W'
p10
a(lp11
I01
aI00
aI00
aaS''
p12
ag12
ag1
ag1
a.(lp0
(lp1
a(lp2
a(lp3
a(lp4
a.(lp0
(lp1
a(lp2
a(lp3
a(lp4
a(lp5
a(lp6
a(lp7
a(lp8
a(lp9
a(lp10
a(lp11
a(lp12
a.(lp0
.(lp0
(lp1
a(lp2
V
p3
ag3
ag3
ag3
ag3
ag3
ag3
ag3
ag3
ag3
aa(lp4
a(lp5
(lp6
a(lp7
aa.(lp0
.(lp0
.(lp0
.(lp0
S'Sin patrón'
p1
a.(lp0
."
      cex_file_encoded = cex_file.encode("ISO-8859-1")
      file.write(cex_file_encoded)
    end
    file_path = 'cex/arxiu'+params[:id]+'.cex'
    send_file file_path, :type=>'text/cex'
  end

  def icaen_uploader
    @xproject = Xproject.find(params[:id])
  end

  def uploadFile
    #File uploader
    post = Xproject.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end

  def write_icaen
    xproject = Xproject.find(params[:id])
    #client_id = xproject.user_id
    #client = User.find(client_id)

    name = params[:xproject][:icaen_xml].original_filename
    directory = "icaen"
    path = File.join(directory, name)
    File.open(path, "wb") { |f| f.write(params[:xproject][:icaen_xml].read) }

    lines = IO.readlines('icaen/' + name)
    @identificador = lines.at(34)
    @caducitat = lines.at(36)

    File.atomic_write('icaen/' + name) do |file|
      icaen_file = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
<GSIT_PICA_GRO_SOLLICITUD xmlns=\"http://gencat.net/scsp/esquemes/productes/gro/gsit/sollicitud\" xmlns:tnsa=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\">
  <DadesTramit>
    <Avisos>
      <CanviEstat>
        <AdrecaElectronica>0</AdrecaElectronica>
        <SMS>0</SMS>
      </CanviEstat>
      <Resolt>
        <AdrecaElectronica>0</AdrecaElectronica>
        <SMS>0</SMS>
      </Resolt>
      <Rebut>
        <AdrecaElectronica>0</AdrecaElectronica>
        <SMS>0</SMS>
      </Rebut>
    </Avisos>
    <Locale>ca_ES</Locale>
    <Versio>1</Versio>
    <VersioFormulari/>
    <EsBloquejat>false</EsBloquejat>
    <Pla>B</Pla>
    <ControlRepetits>
      <Identificador" + @identificador + ">
      <DataCaducitat" + @caducitat + ">
    </ControlRepetits>
    <URLWebService>https://ovt.gencat.cat/gsitgf/AppJava/services/GestorFormularis?wsdl</URLWebService>
    <URLSubmit>https://ovt.gencat.cat/gsitgf/AppJava/traint/tramitar.do?reqCode=tramitar</URLSubmit>
    <ErrorsNegoci>
      <Gestor/>
      <CodiError/>
      <Missatge/>
    </ErrorsNegoci>
    <ErrorsSistema>
      <Gestor/>
      <CodiError/>
      <Missatge/>
    </ErrorsSistema>
    <AvisosNegoci>
      <Avis>
        <Gestor/>
        <CodiAvis/>
        <Missatge/>
      </Avis>
      <Avis>
        <Gestor/>
        <CodiAvis/>
        <Missatge/>
      </Avis>
      <Avis>
        <Gestor/>
        <CodiAvis/>
        <Missatge/>
      </Avis>
      <Avis>
        <Gestor/>
        <CodiAvis/>
        <Missatge/>
      </Avis>
      <Avis>
        <Gestor/>
        <CodiAvis/>
        <Missatge/>
      </Avis>
    </AvisosNegoci>
    <Adjunts>
      <Adjunt>
        <Rol>certificat</Rol>
        <Descripcio>Informe de certificació d'eficiència energètica obtingut amb les eines homologades (format .pdf o .zip)</Descripcio>
      </Adjunt>
      <Adjunt>
        <Rol>arxius</Rol>
        <Descripcio>Arxius informàtics associats al procés de la certificació. (Adjuntar tots els arxius i carpetes generades per les eines homologades durant el procés de certificació en un sol document .zip o .rar)</Descripcio>
      </Adjunt>
      <Adjunt>
        <Rol>encarrec</Rol>
        <Descripcio>Model de representació en el procediment iniciat a instància del propietari, promotor o representant de l'edifici o part del mateix objecte de certificació (format .pdf o .zip)</Descripcio>
      </Adjunt>
      <Adjunt>
        <Rol>recomanacions</Rol>
        <Descripcio>Document amb el detall de les recomanacions de millora d'eficiència energètica de l'edifici o habitatge i descripció de les proves i comprovacions fetes pel tècnic certificador (en .pdf o .zip)</Descripcio>
      </Adjunt>
      <Validacio>
        <Adjunt>
          <Rol>certificat</Rol>
          <Tamany>1000</Tamany>
          <Format>pdf;zip;rar</Format>
          <Opcional>false</Opcional>
        </Adjunt>
        <Adjunt>
          <Rol>arxius</Rol>
          <Tamany>4500</Tamany>
          <Format>zip;rar</Format>
          <Opcional>false</Opcional>
        </Adjunt>
        <Adjunt>
          <Rol>encarrec</Rol>
          <Tamany>1000</Tamany>
          <Format>pdf;zip;rar</Format>
          <Opcional>false</Opcional>
        </Adjunt>
        <Adjunt>
          <Rol>recomanacions</Rol>
          <Tamany>1000</Tamany>
          <Format>pdf;zip;rar</Format>
          <Opcional>false</Opcional>
        </Adjunt>
      </Validacio>
    </Adjunts>
    <Autenticacio>
      <NomConcatenat/>
    </Autenticacio>
    <DadesDepartament>
      <LogotipDept/>
    </DadesDepartament>
    <MidaMaxima>5120</MidaMaxima>
    <PDFObligaSign>true</PDFObligaSign>
    <UrlTramitEnLinia>https%3A%2F%2Fovt.gencat.cat%2Fgsitgf%2FAppJava%2Fce%2Ftraint%2FrenderitzarCE.do%3FreqCode%3Dinicial%26set-locale%3Dca_ES%26idServei%3DENE001SOLC</UrlTramitEnLinia>
  </DadesTramit>
  <Capcalera>
    <Idioma>ca</Idioma>
    <Requeridor tipusUsuari=\"\">
      <Identificador xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\" tipusDocument=\"\">
        <PaisDocument>
          <CodiINE/>
          <Nom/>
        </PaisDocument>
        <Identificador/>
      </Identificador>
    </Requeridor>
    <Desti TipusOrganisme=\"\">
      <IdentificadorDesti xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\"/>
      <SubIdentificador xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\" tipusSubIdentificador=\"\"/>
    </Desti>
    <Objecte>
      <tnsa:Tramit>
        <tnsa:IdTramit>ENE001</tnsa:IdTramit>
        <tnsa:NomTramit>Certificació d'eficiència energètica d'edificis.</tnsa:NomTramit>
      </tnsa:Tramit>
      <tnsa:Modalitat>
        <tnsa:IdModalitat>SOLC</tnsa:IdModalitat>
        <tnsa:Modalitat>Certificació d'eficiència energètica d'edificis</tnsa:Modalitat>
      </tnsa:Modalitat>
      <tnsa:VersioNegoci>201302</tnsa:VersioNegoci>
      <ClassificacioFuncional xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\">
        <NomProcediment/>
        <TipusDocument/>
        <Seguretat>
          <SensibilitatDadesLOPD/>
          <NivellClassificacioEvidencial/>
          <NivellSeguretat/>
        </Seguretat>
      </ClassificacioFuncional>
    </Objecte>
  </Capcalera>
  <Cos>
    <Requeridor tipusUsuari=\"particular\">
      <Particular xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\" esSignatari=\"\">
        <Nom/>
        <Cognom1/>
        <Document tipusDocument=\"\">
          <PaisDocument>
            <CodiINE/>
            <Nom/>
          </PaisDocument>
          <Identificador/>
        </Document>
        <Adreca normalitzada=\"\">
          <Pais>
            <CodiINE/>
            <Nom/>
          </Pais>
          <Provincia/>
          <Comarca/>
          <Municipi>
            <Nom/>
          </Municipi>
          <TipusVia/>
          <NomVia/>
        </Adreca>
        <DadesNaixement/>
      </Particular>
      <Empresa xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\">
        <Nom_RaoSocial/>
        <Adreca normalitzada=\"\">
          <Pais>
            <CodiINE/>
            <Nom/>
          </Pais>
          <Provincia/>
          <Comarca/>
          <Municipi>
            <Nom/>
          </Municipi>
          <TipusVia/>
          <NomVia/>
        </Adreca>
        <Representant esSignatari=\"\">
          <Nom/>
          <Cognom1/>
          <Document tipusDocument=\"\">
            <PaisDocument>
              <CodiINE/>
              <Nom/>
            </PaisDocument>
            <Identificador/>
          </Document>
          <DadesNaixement/>
        </Representant>
        <Document tipusDocument=\"\">
          <Identificador/>
        </Document>
      </Empresa>
    </Requeridor>
    <Presentador tipusUsuari=\"particular\">
      <Particular xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\" esSignatari=\"\">
        <Nom/>
        <Cognom1/>
        <Document tipusDocument=\"\">
          <PaisDocument>
            <CodiINE/>
            <Nom/>
          </PaisDocument>
          <Identificador/>
        </Document>
        <Adreca normalitzada=\"false\">
          <Pais>
            <CodiINE>108</CodiINE>
            <Nom>Espanya</Nom>
          </Pais>
          <Provincia/>
          <Comarca/>
          <Municipi>
            <Nom/>
          </Municipi>
          <TipusVia/>
          <NomVia/>
        </Adreca>
        <DadesNaixement/>
      </Particular>
    </Presentador>
    <Contingut>
      <DadesParticulars>
        <Motius>
          <Id>1</Id>
          <Descripcio>Lloguer</Descripcio>
        </Motius>
        <IdentificacioEdifici>
          <Us>
            <Id>0</Id>
            <Descripcio>Habitatge individual en bloc d'habitatges</Descripcio>
          </Us>
          <TipusCertificat>
            <Id>1</Id>
            <Descripcio>Estimades</Descripcio>
          </TipusCertificat>
          <NumCadastre/>
          <MetresCadastre>86.00</MetresCadastre>
          <DataPrevistaInici/>
          <DataObtencioLlicencia/>
          <dataFinalObra/>
          <Adreca normalitzada=\"false\">
            <Pais xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\">
              <CodiINE/>
              <Nom/>
            </Pais>
            <Provincia xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\"/>
            <Comarca xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\"/>
            <Municipi xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\">
              <Nom/>
            </Municipi>
            <TipusVia xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\"/>
            <NomVia xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\"/>
          </Adreca>
          <Tipus>
            <Id/>
            <Descripcio/>
          </Tipus>
          <NombreHabitatges/>
        </IdentificacioEdifici>
        <TaulaTecnics>
          <PrimerTecnic>
            <Titulacio>
              <Id/>
              <Descripcio/>
            </Titulacio>
            <NumCollegiat/>
            <Collegi/>
          </PrimerTecnic>
        </TaulaTecnics>
        <QualificacioEnergetica>
          <ConsumEnergiaPrimariaAnual>
            <Kwh_any/>
            <Kwh_anym2/>
          </ConsumEnergiaPrimariaAnual>
          <EmissionsAnualsCO2>
            <KgCO2_any/>
            <KgCO2_m2any/>
          </EmissionsAnualsCO2>
          <ZonaClimatica/>
          <Procediment>
            <Id/>
            <Descripcio/>
          </Procediment>
          <Normativa>
            <Id/>
            <Descripcio/>
          </Normativa>
          <QualificacioObtinguda>
            <Id/>
            <Descripcio/>
          </QualificacioObtinguda>
          <QualificacioEnergiaPrimaria>
            <Id/>
            <Descripcio/>
          </QualificacioEnergiaPrimaria>
          <AnyConstruccio/>
        </QualificacioEnergetica>
        <CaracteristiquesEdifici>
          <Tancament/>
          <Aillament>
            <Id/>
            <Descripcio/>
          </Aillament>
          <Obertures/>
          <oberturaMajoritaria>
            <Id/>
            <Descripcio/>
          </oberturaMajoritaria>
          <PotenciaACS/>
          <fontEnergeticaACS>
            <Id/>
            <Descripcio/>
          </fontEnergeticaACS>
          <potenciaCalefaccio/>
          <fontEnergeticaCalefaccio>
            <Id/>
            <Descripcio/>
          </fontEnergeticaCalefaccio>
          <potenciaRefrigeracio/>
          <potenciaIluminacio/>
          <EnergiaSolarTermica>
            <Id/>
            <Descripcio/>
          </EnergiaSolarTermica>
          <ContribucioACS/>
          <EnergiaSolarFotovoltaica>
            <Id/>
            <Descripcio/>
          </EnergiaSolarFotovoltaica>
          <PotenciaInstalada/>
          <EnergiaGeotermica>
            <Id/>
            <Descripcio/>
          </EnergiaGeotermica>
          <SistemaBiomassa>
            <Id/>
            <Descripcio/>
          </SistemaBiomassa>
          <observacions/>
        </CaracteristiquesEdifici>
        <QualificacionsEnergètiquesParcials>
          <EmissionsCalefaccio/>
          <QualificacioCalefaccio>
            <Id/>
            <Descripcio/>
          </QualificacioCalefaccio>
          <EmissionsRefrigeracio/>
          <QualificacioRefrigeracio>
            <Id/>
            <Descripcio/>
          </QualificacioRefrigeracio>
          <EmissionsACS/>
          <QualificacioEmissionsACS>
            <Id/>
            <Descripcio/>
          </QualificacioEmissionsACS>
          <EmissionsEnllumenament/>
          <QualificacioEnllumenament>
            <Id/>
            <Descripcio/>
          </QualificacioEnllumenament>
          <EnergiaCalefaccioConsums/>
          <QualificacioEnergiaCalefaccioConsums>
            <Id/>
            <Descripcio/>
          </QualificacioEnergiaCalefaccioConsums>
          <EnergiaRefrigeracioConsums/>
          <QualificacioEnergiaRefrigeracioConsums>
            <Id/>
            <Descripcio/>
          </QualificacioEnergiaRefrigeracioConsums>
          <EnergiaACSConsums/>
          <QualificacioEnergiaACSConsums>
            <Id/>
            <Descripcio/>
          </QualificacioEnergiaACSConsums>
          <EnergiaEnllumenamentConsums/>
          <QualificacioEnergiaEnllumenamentConsums>
            <Id/>
            <Descripcio/>
          </QualificacioEnergiaEnllumenamentConsums>
          <EnergiaCalefaccioDemanda/>
          <QualificacioEnergiaCalefaccioDemanda>
            <Id/>
            <Descripcio/>
          </QualificacioEnergiaCalefaccioDemanda>
          <EnergiaRefrigeracioDemanda/>
          <QualificacioEnergiaRefrigeracioDemanda>
            <Id/>
            <Descripcio/>
          </QualificacioEnergiaRefrigeracioDemanda>
        </QualificacionsEnergètiquesParcials>
        <Declaro>
          <Declaro1>0</Declaro1>
          <Declaro2>0</Declaro2>
          <Declaro3>0</Declaro3>
          <Declaro4>0</Declaro4>
        </Declaro>
        <Autoritzo>
          <Autoritzo1>0</Autoritzo1>
          <Autoritzo2>0</Autoritzo2>
        </Autoritzo>
      </DadesParticulars>
    </Contingut>
    <InfoServei volRebreAvis=\"0\">
      <DadesContacte xmlns=\"http://gencat.net/scsp/esquemes/productes/gr/comuns\" tipusUsuari=\"particular\">
        <Particular esSignatari=\"\">
          <Nom/>
          <Cognom1/>
          <Document tipusDocument=\"\">
            <PaisDocument>
              <CodiINE/>
              <Nom/>
            </PaisDocument>
            <Identificador/>
          </Document>
          <Adreca normalitzada=\"\">
            <Pais>
              <CodiINE/>
              <Nom/>
            </Pais>
            <Provincia/>
            <Comarca/>
            <Municipi>
              <Nom/>
            </Municipi>
            <TipusVia/>
            <NomVia/>
          </Adreca>
          <DadesNaixement/>
        </Particular>
      </DadesContacte>
    </InfoServei>
  </Cos>
</GSIT_PICA_GRO_SOLLICITUD>"
      file.write(icaen_file)
    end

    file_path = 'icaen/' + name
    send_file file_path, :type=>'text/xml'
  end

  def uploadIcaenForm 

  end



  private
    def xproject_params
      params.require(:xproject).permit(:user_id, :expert_id, :name, :building_road_type, :building_road_name, :building_address_number, :building_block, :building_stairs, :building_story, :building_door, :building_zip_code, :building_town, :cadastre, :construction_period, :construction_year, :project_type, :area, :facade_improvements, :roof_improvements, :window_type, :window_tightness, :facade_definition, :facade_score, :roof_definition, :roof_score, :floor_definition, :floor_score, :windows_definition, :windows_score, :hot_water_type, :hot_water_age, :heating_age, :cooling_type, :cooling_age, :lighting_type, :lighting_power, :contracted_power, :refrigerator_power, :microwave_power, :washingmachine_power, :dishwasher_power, :oven_power, :vitroceramic_power, :tv_power, :pc_power, :stereo_power, :coffeemachine_power, :hot_water_definition, :hot_water_score, :heating_definition, :heating_score, :cooling_definition, :cooling_score, :lighting_definition, :lighting_score, :appliances_definition, :appliances_score, :electricity_consumption_january, :electricity_consumption_february, :electricity_consumption_march, :electricity_consumption_april, :electricity_consumption_may, :electricity_consumption_june, :electricity_consumption_july, :electricity_consumption_august, :electricity_consumption_september, :electricity_consumption_october, :electricity_consumption_november, :electricity_consumption_december, :gas_consumption_january, :gas_consumption_february, :gas_consumption_march, :gas_consumption_april, :gas_consumption_may, :gas_consumption_june, :gas_consumption_july, :gas_consumption_august, :gas_consumption_september, :gas_consumption_october, :gas_consumption_november, :gas_consumption_december, :gasoil_consumption_january, :gasoil_consumption_february, :gasoil_consumption_march, :gasoil_consumption_april, :gasoil_consumption_may, :gasoil_consumption_june, :gasoil_consumption_july, :gasoil_consumption_august, :gasoil_consumption_september, :gasoil_consumption_october, :gasoil_consumption_november, :gasoil_consumption_december, :other_energy_sources, :energy_class_guess, :energy_class, :user_first_name, :user_surname1, :user_surname2, :user_id_document_type, :user_id_document_number, :user_telephone, :user_mobile_phone, :user_road_type, :user_road_name, :user_address_number, :user_block, :user_stairs, :user_story, :user_door, :user_zip_code, :user_town, :report_results, :global_emissions, :global_emissions_rating, :heating_emissions, :heating_emissions_rating, :hot_water_emissions, :hot_water_emissions_rating, :cooling_emissions, :cooling_emissions_rating, :heating_demand, :heating_demand_rating, :cooling_demand, :cooling_demand_rating, :global_primary_energy, :global_primary_energy_rating, :heating_primary_energy, :heating_primary_energy_rating, :hot_water_primary_energy, :hot_water_primary_energy_rating, :cooling_primary_energy, :cooling_primary_energy_rating)
    end
end
