---
title: Arrange, Act, Assert
description: Arrange, Act, Assert
---

The 'arrange, act, assert' mantra is a pattern for structuring your [[Knowledge/Engineering/Testing/Unit Testing|unit tests]] (as well as integration tests and e2e tests). 

The contents of a test should be partitioned into 3 parts in the following order:
1. **Arrange** – the setup code that's required before you can test what you want to test.
2. **Act** – the code that executes what the test intends to do. 
3. **Assert** – the code that makes assertions about what the aftermath should be. 

Some simple, concrete examples of this pattern:
1. Unit testing a C++ function (using [[Knowledge/Engineering/Technologies/GoogleTest|GoogleTest]]). This tests a `SymbolTable` class that's meant to be used as a supporting data structure for a [compiler project](https://github.com/Tymotex/Nand2Tetris).
	```c++
	TEST(SymbolTableTestSuite, InsertAndRetrieveTest) {
	    // Arrange.
	    SymbolTable symbol_table;

		// Act.
	    symbol_table.define("myVar", "int", "var");

		// Assert.
	    EXPECT_EQ(symbol_table.data_type("myVar"), "int");
	    EXPECT_EQ(symbol_table.declaration_type("myVar"), DeclarationType::VAR);
	    EXPECT_EQ(symbol_table.segment_index("myVar"), 0);
	}
	```
1. Unit testing a frontend React component (using [[Knowledge/Engineering/Technologies/Jest|Jest]]). This tests the breadcrumbs component on the portfolio website, [timz.dev](https://timz.dev).
	```typescript
	describe("Breadcrumbs", () => {
	    test("All crumbs are rendered", () => {
			// Arrange.
	        render(
	            <Breadcrumbs
	                crumbs={[
	                    { title: "Home", url: "/" },
	                    { title: "Projects", url: "/projects" },
	                    {
	                        title: "My Sentient Robot",
	                        url: "/projects/my-sentient-robot",
	                    },
	                ]}
	            />,
	        );

			// Act.
	        const home = screen.getByText(/Home/i);
	        const projects = screen.getByText(/Projects/i);
	        const sentientRobot = screen.getByText(/My Sentient Robot/i);

			// Assert.
	        expect(home).toBeInTheDocument();
	        expect(projects).toBeInTheDocument();
	        expect(sentientRobot).toBeInTheDocument();
	    });
    });
	```
1. E2E testing a web app (using [[Knowledge/Engineering/Technologies/Cypress|Cypress]]). This tests that the portfolio website, [timz.dev](https://timz.dev), is able to load the about page via a link on the homepage.
	```typescript
	describe("Portfolio page tests", () => {
	    it("should render the about page after the 'about' link is clicked", () => {
	        // Arrange.
	        cy.visit("http://localhost:3000");
	        cy.wait(1000);
	
	        // Act.
	        cy.contains("About").click(); // The homepage should show
	        cy.wait(1000);
	
	        // Assert.
	        cy.url().should("include", "/about");
	        cy.contains("Who am I?");
	    });
	});
	```

