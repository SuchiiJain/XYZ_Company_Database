import streamlit as st
import mysql.connector
import pandas as pd
import plotly.express as px

# DATABASE CONNECTION
def create_connection():
    return mysql.connector.connect (
    host="localhost",
    user = "xyz_admin",
    password = "12345678",
    database="xyz_company"
) 

# EXECUTE QUERY
def run_query(query):
    conn = create_connection()
    cursor = conn.cursor()
    cursor.execute(query)
    rows = cursor.fetchall()
    cols = [desc[0] for desc in cursor.description]
    conn.close()
    return pd.DataFrame(rows, columns=cols)

# ------------------------------------------
# MAIN APP
# ------------------------------------------
st.set_page_config(page_title="XYZ Company DB Demo", layout="wide")
st.title("📊 XYZ Company Database Interface")

tab1, tab2, tab3 = st.tabs(["Views", "Predefined Queries", "CRUD Operations"])

# ------------------------------------------
# CRUD OPERATIONS TAB
# ------------------------------------------
with tab3:
    st.subheader("CRUD for Person Table")

    crud_action = st.radio("Choose Action", ["Create", "Read", "Update", "Delete"])
    if crud_action == "Create":
        st.markdown("### ➕ Add New Person")
        first_name = st.text_input("First Name")
        last_name = st.text_input("Last Name")

        if st.button("Insert Person"):
            if first_name and last_name:
                conn = create_connection()
                cursor = conn.cursor()

                # Get max person_id like 'P001'
                cursor.execute("SELECT person_id FROM person WHERE person_id LIKE 'P%' ORDER BY person_id DESC LIMIT 1")
                result = cursor.fetchone()

                if result:
                    last_id = result[0]  # e.g., "P012"
                    numeric_part = int(last_id[1:])  # "012" → 12
                    new_id = f"P{numeric_part + 1:03d}"  # → "P013"
                else:
                    new_id = "P001"  # First record

                cursor.execute(
                    "INSERT INTO person (person_id, first_name, last_name) VALUES (%s, %s, %s)",
                    (new_id, first_name, last_name)
                )
                conn.commit()
                conn.close()
                st.success(f"Inserted {first_name} {last_name} with ID {new_id}")
            else:
                st.warning("Please fill in both fields.")

    elif crud_action == "Read":
        st.markdown("### 📄 All Persons")
        df = run_query("SELECT person_id, first_name, last_name FROM person")
        st.dataframe(df)

    elif crud_action == "Update":
        st.markdown("### ✏️ Edit Person Record")
        df = run_query("SELECT person_id, first_name, last_name FROM person")
        df["display"] = df["person_id"] + ": " + df["first_name"] + " " + df["last_name"]
        selected = st.selectbox("Select a person", df["display"])
        selected_id = selected.split(":")[0]

        new_first = st.text_input("New First Name")
        new_last = st.text_input("New Last Name")

        if st.button("Update Person"):
            if new_first and new_last:
                conn = create_connection()
                cursor = conn.cursor()
                cursor.execute(
                    "UPDATE person SET first_name = %s, last_name = %s WHERE person_id = %s",
                    (new_first, new_last, selected_id)
                )
                conn.commit()
                conn.close()
                st.success(f"Updated person {selected_id} successfully!")
            else:
                st.warning("Both fields are required to update.")

    elif crud_action == "Delete":
        st.markdown("### ❌ Delete Person")
        df = run_query("SELECT person_id, first_name, last_name FROM person")
        df["display"] = df["person_id"] + ": " + df["first_name"] + " " + df["last_name"]
        selected = st.selectbox("Select a person to delete", df["display"])
        selected_id = selected.split(":")[0]

        if st.button("Delete Person"):
            conn = create_connection()
            cursor = conn.cursor()

            # Check dependencies in employee table
            cursor.execute("SELECT COUNT(*) FROM employee WHERE person_id = %s", (selected_id,))
            emp_count = cursor.fetchone()[0]

            if emp_count > 0:
                st.error(f"Cannot delete person {selected_id}: referenced in 'employee' table.")
            else:
                cursor.execute("DELETE FROM person WHERE person_id = %s", (selected_id,))
                conn.commit()
                st.success(f"Deleted person {selected_id} successfully.")

            conn.close()


# ------------------------------------------
# VIEWS TAB
# ------------------------------------------
with tab1:
    st.subheader("View Results")

    view_options = {
        "Average Monthly Salary per Employee": "select * from View1",
        "Interviewee Passed Rounds Count": "select * from View2",
        "Sales Count by Product Type": "select * from View3",
        "Total Part Cost per Product": "select * from View4"
    }

    selected_view = st.selectbox("Select a view to display", list(view_options.keys()))
    query = view_options[selected_view]

    if st.button("Run View"):
        result_df = run_query(query)
        st.dataframe(result_df)

# ------------------------------------------
# PREDEFINED QUERIES TAB
# ------------------------------------------
with tab2:
    st.subheader("Predefined Project Queries")

    query_list = {
        "1. Interviewers for Hellen Cole (job '11111')":
            "select I.interviewer_id, concat(P.first_name, ' ', P.last_name) as interviewer_name "
            "from interview I join person P on I.interviewer_id = P.person_id "
            "join person PE on I.interviewee_id = PE.person_id "
            "where I.job_id = '11111' and PE.first_name = 'Hellen' and PE.last_name = 'Cole'",

        "2. Jobs posted by Marketing in January 2011":
            "select job_id from job_position JP join department D on JP.department_id = D.department_id "
            "where D.department_name = 'Marketing' and month(posted_date) = 1 and year(posted_date) = 2011",

        "3. Employees with no supervisees":
            "select E.person_id, concat(P.first_name, ' ', P.last_name) as employee_name "
            "from employee E join person P on E.person_id = P.person_id "
            "where E.person_id not in (select supervisor_id from employee where supervisor_id is not null)",

        "4. Marketing sites with no sales in March 2011":
            "select MS.site_id, MS.site_location from marketing_site MS "
            "where MS.site_id not in (select site_id from sale_history where month(sale_time) = 3 and year(sale_time) = 2011)"
    }

    selected_query = st.selectbox("Select a query to run", list(query_list.keys()))
    if st.button("Run Query"):
        query_text = query_list[selected_query]
        query_df = run_query(query_text)
        st.dataframe(query_df)
