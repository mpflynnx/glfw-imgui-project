class App
{

public:
    // Constructor
    App()
    {
        // Setup
    }

    // Destructor
    virtual ~App()
    {
        // Cleanup
    }

    void Run()
    {
        // Our state
        StartUp();

        // Main loop
        while (true)
        {
            Update();
        }

    }

    virtual void Update() = 0;
    virtual void StartUp() = 0;

private:


};