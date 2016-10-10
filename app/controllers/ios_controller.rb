class IosController < AuthenticatedController
  # load_and_authorize_resource :profile
  # load_and_authorize_resource :io, :through => :profile

  before_action :set_io, :except => [:index, :new, :create]

  load_resource :profile, :only => [:index, :new, :create]
  load_resource :io, :through => :profile, :only => [:index, :new, :create]

  authorize_resource :profile, :only => [:index, :new, :create]
  authorize_resource :io

  # load_and_authorize_resource :profile, :only => [:index, :new, :create]
  # load_and_authorize_resource :io, :through => :profile, :only => [:index, :new, :create]

  

  # GET /ios
  # GET /ios.json
  def index
    @ios = Io.all
  end

  # GET /ios/1
  # GET /ios/1.json
  def show
  end

  # GET /ios/new
  def new
    @io = Io.new
  end

  # GET /ios/1/edit
  def edit
  end

  # POST /ios
  # POST /ios.json
  def create
    @io = Io.new(io_params)

    respond_to do |format|

      @profile.ios << @io

      if @io.save
        format.html { redirect_to @io, notice: 'Io was successfully created.' }
        format.json { render :show, status: :created, location: @io }
      else
        format.html { render :new }
        format.json { render json: @io.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ios/1
  # PATCH/PUT /ios/1.json
  def update
    respond_to do |format|
      if @io.update(io_params)
        format.html { redirect_to @io, notice: 'Io was successfully updated.' }
        format.json { render :show, status: :ok, location: @io }
      else
        format.html { render :edit }
        format.json { render json: @io.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ios/1
  # DELETE /ios/1.json
  def destroy
    @io.destroy
    respond_to do |format|
      format.html { redirect_to ios_url, notice: 'Io was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def status
    particle_device = Particle::Device.new(external_id: @io.device.external_id, settings: @io.settings_json)
    render json: particle_device.get_status
  end

  def trigger
    particle_device = Particle::Device.new(external_id: @io.device.external_id, settings: @io.settings_json)
    render json: particle_device.trigger(params["actionFunction"])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_io
      @io = Io.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def io_params
      io_params_hash = params.fetch(:io, {}).permit!

      io_params_hash[:settings] = io_params_hash[:settings].to_json
      p io_params_hash
    end
end
